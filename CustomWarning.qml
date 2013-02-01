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
    height: parent.height * 0.28
    property alias text: message.text
    visible: text != "" ? true : false

    Rectangle {
        anchors.fill: parent
        color: "black"
        radius: 5
        }

    Text {
        id: message
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.leftMargin: 10
        width: parent.width
        height: parent.height * 0.66
        color: "white"
        font.bold: true
        font.pixelSize: 20
        font.wordSpacing: 6
        wrapMode: Text.Wrap
        //text: appModel.p_errormsg;
        }

    TextButton {
        id: okbutton
        anchors.bottom: parent.bottom
        //anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.8
        height: parent.height * 0.20
        anchors.bottomMargin: height * 0.66
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1
        text: "OK";
        onClicked: {
        //FIXME: make this generic and delink this with property
        //appModel.p_errormsg = "";
            message.text = ""
            }
        }
    }
