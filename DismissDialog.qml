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
import QtQuick 1.0

Item {
    width: mother.width * 0.9
    height: mother.height * 0.45
    property alias text: message.text
		
    Rectangle {
        anchors.fill: parent
        color: "black"
        radius: 5
        }

    Text {
        id: message
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: (parent.width - width) / 2
        width: parent.width * 0.8
        height: parent.height * 0.2
        color: "white"
        font.bold: true
        font.pixelSize: 20
        font.wordSpacing: 6
        wrapMode: Text.Wrap
        text: appModel.p_remainingtime;
        }

    Rectangle {
        id: dismissitem
        anchors.top: message.bottom
        anchors.topMargin: parent.height * 0.15;
        anchors.left: parent.left
        anchors.leftMargin: (parent.width - width) / 2
        width: parent.width * 0.8;
        height: 50;//parent.height * 0.1;
        radius: 5

        gradient: Gradient {
            GradientStop { id: gradientStop; position: 0.0; color: "red" }
            GradientStop { position: 1.0; color: "#ff1100" }
        }

        SystemPalette { id: palette }

        Item {
            id: redtitle
            width: parent.width;
            height: parent.height
            z:2
            Text {
                id: loadingText
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "black"
                font.bold: true
                font.pixelSize: 20
                text: "Dismiss Timer"
                }
            }//title

        MouseArea {
            id: dismisbutton
            anchors.fill: parent

            onReleased: {
                appModel.Dismiss();
                }
            }

        states: State {
            name: "pressed"
            when: dismisbutton.pressed
            PropertyChanges { target: gradientStop; color: palette.dark }
            }
       }//dismiss button

    Rectangle {
        id: snoozeitem
        anchors.top: dismissitem.bottom
        anchors.topMargin: parent.height * 0.1;
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: parent.height * 0.1;
        anchors.left: parent.left
        anchors.leftMargin: (parent.width - width) / 2
        width: parent.width * 0.8;
        height: 50;//parent.height * 0.1;
        radius: 5

        gradient: Gradient {
            GradientStop { id: gradientStop2; position: 0.0; color: "green" }
            GradientStop { position: 1.0; color: "#11ff11" }
        }

        SystemPalette { id: palette2 }

        Item {
            id: greentitle
            width: parent.width;
            height: parent.height
            z:2
            Text {
                id: snoozetext
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "black"
                font.bold: true
                font.pixelSize: 20
                text: "Snooze by 15mins."
                }
            }//title

        MouseArea {
            id: snoozeMA
            anchors.fill: parent
            onReleased: {
                appModel.Snooze(15);
                }
            }

        states: State {
            name: "pressed"
            when: snoozeMA.pressed
            PropertyChanges { target: gradientStop2; color: palette2.dark }
            }
       }//snooze button
    }
