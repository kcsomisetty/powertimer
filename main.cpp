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
#include <QtGui/QApplication>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QDesktopWidget>
#include <QtCore>
#include "model.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QDesktopWidget* desktopWidget = QApplication::desktop();
    QRect clientRect = desktopWidget->screenGeometry();
    QDeclarativeView view;
    QObject *item = (QObject*)view.rootObject();
    Model m(item);
    view.rootContext()->setContextProperty("appModel", &m);

#if QT_VERSION > 0x040701
    view.setAttribute( Qt::WA_LockPortraitOrientation, true);
#endif

    view.setSource(QUrl("qrc:/ui.qml"));

    view.setSceneRect(clientRect);
    view.setResizeMode(QDeclarativeView::SizeRootObjectToView);
    view.showFullScreen();


    QObject::connect((QObject*)view.engine(), SIGNAL(quit()), &app, SLOT(quit()));
    QObject::connect(&m, SIGNAL(canQuit()), &app, SLOT(quit()));
    QObject::connect(&m, SIGNAL(viewToBeShown()), (QObject*)view.rootObject(), SLOT(qmlviewabouttobeshown()));

    m.viewToBeShownNow();
    view.show();

    return app.exec();
}

