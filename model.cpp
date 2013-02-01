//PowerTimer is timer utility app for symbian smartphones
//to schedule turnoff's and closing app's automatically
//Copyright (C) 2010 Krishna Somisetty

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//PowerTimer is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.
#include <QDesktopServices>
#include <QUrl>
#include <QFile>
#include <QDateTime>
#include <QSound>

#include "model.h"

#ifdef Q_OS_SYMBIAN
#include <eikenv.h>
#include <aknkeylock.h>
#include <eikon.hrh>
#include <apgtask.h>
#include <eikappui.h>
#include <aknenv.h>
#include <aknappui.h>
#include <e32std.h>
#include <apgwgnam.h>
#endif


Model::Model(QObject* parent):
        QAbstractListModel(parent),
        m_hours(1),
        m_minutes(1), //1*15 = 15
        m_realminutes(0),
        m_operation(1), //default op is turnoff.        
        m_remainingtime(""),
        m_applistrequired(false),
        m_timer(NULL)
{
    LS("Model::Model =>>");
    QString fi(CONFIGFILE);
    QFile file( fi.toLower() );

    if ( file.open( QIODevice::ReadOnly ) )
        {
        QDataStream stream( &file );
        int version = 0;
        stream >> version;
        //this is the place to discriminate against versions.
        //stream >> m_operation;
        int operation;
        stream >> operation;
        stream >> m_hours;
        stream >> m_minutes;
        }
    else
        {
        }

    QHash<int, QByteArray> roles;
    roles[0] = "name";
    roles[1] = "icon";
    roles[2] = "uid";
    roles[3] = "isselected";
		
    setRoleNames(roles);

#ifdef SINGLAPPVERSION
    AppEntry* entry = new AppEntry;
    entry->caption = "Music Player";
    entry->uid = 270561987;//Music Player uid. once the dynamic app selection is enabled. this line should be commented
    entry->isselected = true;
    m_applist.append(entry);
#endif

    LS("Model::Model <<");
}

Model::~Model()
{
    LS("Model::~Model =>>");

    QFile file( CONFIGFILE );
    if ( file.open( QIODevice::WriteOnly ) )
        {
        QDataStream stream( &file );

        stream << VERSION;
        stream << m_operation;
        stream << m_hours;
        stream << m_minutes;

        file.close();
        }
    else
        {
        //nothing can be done in a destructor
        }

    qDeleteAll(m_applist);
    m_applist.clear();
    m_listtoclose.clear();

    if(m_timer)
    {
        m_timer->stop();
        m_timer->deleteLater();
        m_timer = 0;
    }
    LS("Model::~Model <<");
}

int Model::rowCount(const QModelIndex& index ) const
{
    return m_applist.count();
}

QVariant Model::data(const QModelIndex& index, int role ) const
{
    if (!index.isValid())
        return QVariant();

    if (role == 0) {return QVariant(m_applist.at(index.row())->caption);}
    else if (role == 1) {return QVariant();}
    else if (role == 2) {return QVariant();}
    else if (role == 3) {return QVariant(m_applist.at(index.row())->isselected);}
    else
        {}
}

QString Model::stringfromminutes(int minutes)
{
    int mins = minutes;
    int hours = 0;

    while(mins >= 60)
        {
        hours++;
        mins = mins-60;
        }

    setremhours(QString::number(hours));
    setremmins(QString::number(mins));

    if(m_operation == 1)
        return QString("Phone will Turn off in");
    else
        return QString("Application(s) will exit in");
}

void Model::StartOperation()
{
    LS("Model::StartOperation() =>>");
    LS(m_hours);
    LS(m_minutes*15);

    m_realminutes = m_hours * 60 + ( (m_minutes*15));

    LS(m_realminutes);

//    if(m_realminutes == 15)
//        m_realminutes = 1;

    if(m_realminutes <= 0)
        {
        m_realminutes = 0;
        //FIXME: show warning message here.
        setremainingtime("");
        return;
        }

    setremainingtime(stringfromminutes(m_realminutes));

    if(!m_timer)
        m_timer = new QTimer;
    else if(m_timer->isActive())
        m_timer->stop();

    connect(m_timer, SIGNAL(timeout()), this, SLOT(update()));
    m_timer->setInterval(60000);
    m_timer->start();    
    LS("Model::StartOperation() <<");
}

void Model::movetoBackgroundSlot()
    {
    //emit movetoBackground();
#ifdef Q_OS_SYMBIAN
    //move to background only if you dismiss dialog is still active.
    if(remainingtime().isEmpty())
        return;

    RWsSession& wsSession = CEikonEnv::Static()->WsSession();
    TUid uid;
    uid.iUid = APPUID;
    TApaTaskList list (wsSession);
    TApaTask ap = list.FindApp(uid);
    if(ap.Exists())
        ap.SendToBackground();
#endif
    }

void Model::update()
{
    LS("Model::update =>>");
    m_realminutes--;
    LS(m_realminutes);

    setremainingtime(stringfromminutes(m_realminutes));

    if(m_realminutes == 1)
        {
        //play some music/tone before one minute
        //QMediaPlayer player;
        //QMediaContent cont(QUrl("file://c:/data/feedback.wav"));
        //player.setMedia(cont);
        //player.play();
        //QFeedbackHapticsEffect rumble;
        //rumble.setIntensity(1.0);
        //rumble.setDuration(100);
        //rumble.start();
        }
    else if(m_realminutes <= 0)
       {
       ExecuteOperation();
       m_timer->stop();
       }
    else {}

    LS("Model::update <<");
}

void Model::Dismiss()
{
    if(m_timer->isActive())
      {
          m_timer->stop();
          m_timer->deleteLater();
          m_timer = 0;
      }
    setremainingtime("");
}

void Model::Snooze(int minutes)
{
    m_realminutes += minutes;
    setremainingtime(stringfromminutes(m_realminutes));
}


void Model::ExecuteOperation()
{
LS("Model::ExecuteOperation =>>");
#ifdef Q_OS_SYMBIAN
    RWsSession& wsSession = CEikonEnv::Static()->WsSession();    

    if(m_operation == 0)
    {
        foreach(AppEntry* entry, m_applist)
        {
            if(entry->isselected)
            {
            TUid uid;
            uid.iUid = entry->uid;
            TApaTaskList list (wsSession);
            TApaTask ap = list.FindApp(uid);
            if(uid.iUid == 537067464) //internet radio needs kill task.
                ap.KillTask();
            else
                ap.EndTask();

            //FIXME: handle app closing failures
            }
        }
    }
    else if(m_operation == 1)
    {
        //first unlock and then switch off.
        RAknKeyLock aKeyLock;
        aKeyLock.Connect();
        TBool isLocked = aKeyLock.IsKeyLockEnabled();
        // aKeyLock.EnableKeyLock()
        // aKeyLock.EnableWithoutNote();

        if(isLocked)
            aKeyLock.DisableKeyLock();// or aKeyLock.DisableWithoutNote(); //disables keypad lock

        aKeyLock.Close();

        RWsSession& wsSession = CEikonEnv::Static()->WsSession();
        TWsEvent  event;
        event.SetType(EEventKey);
        event.SetTimeNow();
        event.Key()->iCode = EKeyPowerOff;
        event.Key()->iModifiers = 0;
        event.Key()->iRepeats = 1;
        event.Key()->iScanCode = 0;
        wsSession.SendEventToAllWindowGroups( event );
        wsSession.Flush();
    }
    else
    {
        //RDebug::Print(_L("hmm..interesting"));
    }

#endif
    emit canQuit();
LS("Model::ExecuteOperation <<");
}

bool Model::applistrequired()
{
return m_applistrequired;
}

void Model::setapplistrequired(bool applistrequired)
{
    LS("Model::setapplistrequired =>>");

#ifndef SINGLAPPVERSION
    if(applistrequired)
        {
        #ifdef Q_OS_SYMBIAN
        emit beginResetModel();

        m_applist.clear();

        RWsSession& wsSession = CEikonEnv::Static()->WsSession();
        CApaWindowGroupName* wgName = CApaWindowGroupName::NewL(wsSession);
        CleanupStack::PushL(wgName);
        CArrayFixFlat<TInt>* WindowGroupIds = new(ELeave)CArrayFixFlat<TInt>(1);
        CleanupStack::PushL(WindowGroupIds);
        User::LeaveIfError(wsSession.WindowGroupList(0,WindowGroupIds));
        const TInt count = WindowGroupIds->Count();

        for (TInt ii=0; ii<count; ii++)
            {
            TInt wgId = WindowGroupIds->At(ii);
            wgName->ConstructFromWgIdL(wgId);
            if(wgName->IsSystem() || wgName->Hidden() || wgName->AppUid().iUid == APPUID || wgName->AppUid().iUid == 0)
                continue;

            AppEntry* entry = new AppEntry;
            entry->uid = wgName->AppUid().iUid;
            HBufC* b = wgName->Caption().AllocL();
            //entry->caption = QString((QChar*)&wgName->Caption(), wgName->Caption().Length()); //QString::number(entry->uid);//
            entry->caption = QString((QChar*)b->Des().Ptr(), b->Length());
            delete b;

            if(m_listtoclose.indexOf(entry->uid) == -1 )
                entry->isselected = false;
            else
                entry->isselected = true;

//            RDebug::Print(_L("%S"), &wgName->Caption());
//            RDebug::Print(_L("%x"), wgName->AppUid().iUid);
            m_applist.append(entry);
            }
        CleanupStack::PopAndDestroy(2);//WindowGroupIds, wgName

        emit endResetModel();
        #endif
        }

    m_applistrequired = applistrequired;
    emit applistrequiredChanged();
    //qDebug()<<m_applist;
#endif

    LS("Model::setapplistrequired <<");
}

void Model::viewToBeShownNow()
{
    LS("Model::viewToBeShownNow >");
    emit viewToBeShown();
    LS("Model::viewToBeShownNow <");
}

void Model::updateappstocloselist(int index)
{
LS("Model::updateappstocloselist >>");
//qDebug() << index;
if(index < 0 || index >= m_applist.count())
    return;

emit beginResetModel();
if(m_applist.at(index)->isselected)
    m_applist.at(index)->isselected = false;
else
    m_applist.at(index)->isselected = true;
emit endResetModel();

LS("Model::updateappstocloselist <<");
}

bool Model::canlaunch()
{
    LS("Model::canlaunch() >>");
    foreach(AppEntry* entry, m_applist)
    {
        if(entry->isselected)
        {
            return true;
        }
    }
    LS("Model::canlaunch() <<");
    return false;
}
