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
#ifndef MODEL_H
#define MODEL_H

#include <QAbstractItemModel>
#include <QPixmap>
#include <QTimer>

#include "config.h"

struct AppEntry {
    QString caption;
    QPixmap icon;
    qint64 uid;
    bool isselected;
};

class Model: public QAbstractListModel  {
    Q_OBJECT

    Q_PROPERTY(  QString p_remainingtime
                 READ remainingtime
                 WRITE setremainingtime
                 NOTIFY remainingtimeChanged)

    Q_PROPERTY(  QString p_remhours
                 READ remhours
                 WRITE setremhours
                 NOTIFY remhoursChanged)

    Q_PROPERTY(  QString p_remmins
                 READ remmins
                 WRITE setremmins
                 NOTIFY remminsChanged)

    Q_PROPERTY(  bool p_applistrequried
                 READ applistrequired
                 WRITE setapplistrequired
                 NOTIFY applistrequiredChanged)

    Q_PROPERTY(  int p_hours
                 READ hours
                 WRITE sethours
                 NOTIFY hoursChanged)

    Q_PROPERTY(  int p_minutes
                 READ minutes
                 WRITE setminutes
                 NOTIFY minutesChanged)

    Q_PROPERTY(  int p_operation
                 READ operation
                 WRITE setoperation
                 NOTIFY operationChanged)

public:

    Model(QObject* parent = NULL);
    ~Model();

    virtual int rowCount(const QModelIndex& index ) const;
    virtual QVariant data(const QModelIndex& index, int role ) const;

    bool applistrequired();
    void setapplistrequired(bool applistrequired);

    void setremainingtime(const QString msg) {
        m_remainingtime = msg;
        emit remainingtimeChanged();
    }

    QString remhours() {
        return m_remhours;
    }

    void setremhours(QString hours) {
        m_remhours = hours;
        emit remhoursChanged();
    }

    QString remmins() {
        return m_remmins;
    }

    void setremmins(QString mins) {
        m_remmins = mins;
        emit remminsChanged();
    }

    QString remainingtime() {
        return m_remainingtime;
    }

    int hours() {return m_hours;}
    void sethours(int hours)
    {
        m_hours = hours;
        emit hoursChanged();
    }

    int minutes() {return m_minutes;}
    void setminutes(int minutes)
        {
        m_minutes = minutes;
        emit minutesChanged();
        }

    int operation() {return m_operation;}
    void setoperation(int operation)
        {
        LS("setoperation");
        LS(operation);
        m_operation = operation;
        emit operationChanged();
        }
    void viewToBeShownNow();

    //Q_INVOKABLE void setDuration(int hours, int minutes);
    //0 - close apps
    //1 - shutdown
    Q_INVOKABLE void StartOperation();
    Q_INVOKABLE void Dismiss();
    Q_INVOKABLE void Snooze(int minutes);
    Q_INVOKABLE void updateappstocloselist(int index);
    Q_INVOKABLE bool canlaunch();

signals:
    void canQuit();
    void remainingtimeChanged();
    void applistrequiredChanged();
    void hoursChanged();
    void minutesChanged();
    void operationChanged();
    void viewToBeShown();
    void remhoursChanged();
    void remminsChanged();

private:
    void ExecuteOperation();
    QString stringfromminutes(int minutes);
public slots:
    void update();
    void movetoBackgroundSlot();
private slots:

private:
    int m_operation;
    int m_hours;
    int m_minutes;
    int m_realminutes; //real minutes include snooze values. so
    QList<AppEntry*> m_applist;
    QList<qint64> m_listtoclose;
    QString m_remainingtime;
    bool m_applistrequired;
    QTimer* m_timer;
    QString m_remhours;
    QString m_remmins;

};

#endif // MODEL_H
