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

Rectangle {
    id: mother
    width: 360
    height: 640

    property int hours: 0;

    Rectangle
        {
        id: background
        anchors.fill: parent;
        color: "#343434"
        Image { source: "stripes.png"; fillMode: Image.Tile; anchors.fill: parent;  opacity: 0.3 }
        }

    Item{
        id: uicontrols
        //anchors.fill:  parent
        width: parent.width
        height: parent.height
        x: appModel.p_remainingtime == "" ? 0 : -mother.width

        Item {
            id: timecontrol
            width: mother.width * 0.8;
            height: mother.height * 0.40;
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin:  parent.height * 0.01;
            anchors.leftMargin: (mother.width * 0.2) / 2
            z:3

            Image {
                id:backg
                source: "timercontrol.png";
                anchors.fill: parent
                width: parent.width;
                height: parent.height;//parent.height * 0.1;
                z:-1
                }

            Rectangle {
                id: top
                width: parent.width * 0.89
                height: parent.height * 0.8
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.055
                anchors.top: parent.top
                anchors.topMargin: (parent.height - height) / 2;
                color: "#0000ff00"
                //z:5

                Rectangle {
                    id: showselectionstrip
                    height: parent.height * 0.28;
                    width: parent.width * 0.98
                    anchors.left: parent.left
                    anchors.leftMargin: ( parent.width - width ) * 0.7;
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - height) * 0.42;
                    color: "#00e5d5ff"
                    border.width: 2
                    border.color: "black"
                    opacity:0.5
                    z:1
                    radius: 3
                    }

                Item {
                    id: firsthalf
                    width: parent.width * 0.5
                    height: parent.height;
                    anchors.left: parent.left
                    //color: "red"
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - height) / 2;

                    Rectangle {
                        id: hoursrect
                        width: parent.width * 0.52;
                        height: parent.height;
                        color: "#00ffffff"
                        radius: 10
                        anchors.left: parent.left
                        z:2
                        anchors.top: parent.top
                        clip: true

                            Rectangle {
                                id: parallaxholder2
                                width: parent.width
                                height: parent.height * 0.6
                                anchors.top: parent.top
                                anchors.topMargin: height * 0.44
                                //color: "cyan"
                                color: "#00ffffff"

                            ParallaxView {
                                id: hourslist
                                anchors.fill: parent
                                z:2

                                Rectangle {
                                    width: parallaxholder2.width
                                    height: parallaxholder2.height * 0.6
                                    color: "#00e0e0e0"

                                    Text {
                                        id: hourstext0
                                        anchors.fill: parent
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        color: "black"
                                        font.bold: true
                                        font.pixelSize: 50
                                        text: "0"
                                        }
                                    }

                                Rectangle {
                                    width: parallaxholder2.width
                                    height:  parallaxholder2.height * 0.6
                                    color: "#00ececec"

                                    Text {
                                        id: hourstext1
                                        anchors.fill: parent
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        color: "black"
                                        font.bold: true
                                        font.pixelSize: 50
                                        text: "1"
                                        }
                                    }

                                Rectangle {
                                    width: parallaxholder2.width
                                    height:  parallaxholder2.height * 0.6
                                    color: "#00e0e0e0"

                                    Text {
                                        id: hourstext2
                                        anchors.fill: parent
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        color: "black"
                                        font.bold: true
                                        font.pixelSize: 50
                                        text: "2"
                                        }
                                }

                                Rectangle{
                                    width: parallaxholder2.width
                                    height:  parallaxholder2.height * 0.6
                                    color: "#00ececec"

                                    Text {
                                        id: hourstext3
                                        anchors.fill: parent
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        color: "black"
                                        font.bold: true
                                        font.pixelSize: 50
                                        text: "3"
                                        }
                                }
                                Rectangle{
                                    width: parallaxholder2.width
                                    height:  parallaxholder2.height * 0.6
                                    color: "#00ececec"

                                    Text {
                                        id: hourstext4
                                        anchors.fill: parent
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        color: "black"
                                        font.bold: true
                                        font.pixelSize: 50
                                        text: "4"
                                        }
                                }
                                Rectangle{
                                    width: parallaxholder2.width
                                    height:  parallaxholder2.height * 0.6
                                    color: "#00ececec"

                                    Text {
                                        id: hourstext5
                                        anchors.fill: parent
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        color: "black"
                                        font.bold: true
                                        font.pixelSize: 50
                                        text: "5"
                                        }
                                }
                            }
                            }
                        }

                    Rectangle {
                        id: hoursstringrect
                        width: parent.width * 0.40;
                        height: parent.height;
                        color: "#00ffffff"
                        anchors.left: hoursrect.right
                        anchors.top: parent.top
                        z:2

                        Text {
                            id: hoursstring
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            color: "black"
                            font.bold: true
                            font.pixelSize: 15
                            text: "hours"
                            }
                        }

                    }

                Item {
                id: secondhalf
                width: parent.width * 0.5
                height: parent.height;
                anchors.left: firsthalf.right
                //color: "yellow"
                anchors.top: parent.top
                anchors.topMargin: (parent.height - height) / 2;

                Rectangle {
                    id: minutesrect
                    width: parent.width * 0.52;
                    height: parent.height;
                    anchors.left: parent.left
                    color: "#00ffffff"
                    radius: 10
                    z:2
                    anchors.top: parent.top
                    clip: true

                    Rectangle {
                        id: parallaxholder
                        width: parent.width
                        height: parent.height * 0.6
                        anchors.top: parent.top
                        anchors.topMargin: height * 0.44
                        //color: "cyan"
                        color: "#00ffffff"

                    ParallaxView {
                        id: minuteslist
                        anchors.fill: parent
                        z:2

                        Rectangle {
                            width: parallaxholder.width
                            height: parallaxholder.height * 0.6
                            color: "#00e0e0e0"

                            Text {
                                id: minutestext0
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                color: "black"
                                font.bold: true
                                font.pixelSize: 50
                                text: "0"
                                }
                            }

                        Rectangle {
                            width: parallaxholder.width
                            height:  parallaxholder.height * 0.6
                            color: "#00ececec"

                            Text {
                                id: minutestext15
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                color: "black"
                                font.bold: true
                                font.pixelSize: 50
                                text: "15"
                                }
                            }

                        Rectangle {
                            width: parallaxholder.width
                            height:  parallaxholder.height * 0.6
                            color: "#00e0e0e0"

                            Text {
                                id: minutestext30
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                color: "black"
                                font.bold: true
                                font.pixelSize: 50
                                text: "30"
                                }
                        }

                        Rectangle{
                            width: parallaxholder.width
                            height:  parallaxholder.height * 0.6
                            color: "#00ececec"

                            Text {
                                id: minutestext45
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                color: "black"
                                font.bold: true
                                font.pixelSize: 50
                                text: "45"
                                }
                        }
                    }
                    }
                }
                Rectangle {
                    id: minutesstringrect
                    width: parent.width * 0.35;
                    height: parent.height;
                    color: "#00ffffff"
                    anchors.left: minutesrect.right
                    anchors.top: parent.top
                    z:2

                    Text {
                        id: minutestring
                        anchors.top: parent.top
                        anchors.topMargin: (parent.height - height) / 2;
                        color: "black"
                        font.bold: true
                        font.pixelSize: 15
                        text: "mins."
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }

        Item {
            id: operationcontrol
            width: mother.width * 0.8;
            height: parent.height * 0.07;
            anchors.top: timecontrol.bottom
            anchors.topMargin:  parent.height * 0.02;
            anchors.left: parent.left
            anchors.leftMargin: (mother.width - width) / 2
            clip: true
            //state: appModel.p_operation == 1? "" : "closeapps";

            //FOR SYMBIAN^1
            Item {
                id: turnoffitem
                width: parent.width;
                height: parent.height
                z:2
                anchors.top: parent.top

                Rectangle {
                    //source: "front.png"
                    width: parent.width;
                    height: parent.height;
                    radius: 5
                    color: "lightgray"
                    }

                Text {
                    height: parent.height
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black"
                    font.bold: true
                    font.pixelSize: 20
                    text: "Turn Off Phone"
                    }
                }//title

            Item {
                id: closeappsitem
                width: parent.width;
                height: parent.height
                z:2
                anchors.top: turnoffitem.bottom

                Rectangle {
                    //source: "front.png"
                    width: parent.width;
                    height: parent.height;
                    radius: 5
                    color: "darkgray"
                    }

                Text {
                    height: parent.height
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black"
                    font.bold: true
                    font.pixelSize: 20
                    text: "Close Applications"
                    }
                }//title

            MouseArea {
                id: operationcontrolMA
                anchors.fill: parent
                //default state is turn off.
                onReleased: {
                    if(operationcontrol.state == "")
                        operationcontrol.state = "closeapps"
                    else
                        operationcontrol.state = ""
                    }
                }


        states: State {
            name: "closeapps"
            PropertyChanges { target: turnoffitem;  height: 0;}
            PropertyChanges { target: appModel;  p_applistrequried: true;}
            }

        transitions: [
            Transition {
                from: ""; to: "closeapps"
                NumberAnimation {property : "height"; duration: 250;}
                },
            Transition {
                from: "closeapps"; to: ""
                NumberAnimation {property : "height"; duration: 250;}
                }
        ]
        //FOR SYMBIAN^1

        }

        Rectangle {
            id: applist
            width: parent.width * 0.8;
            height: operationcontrol.state == "" ? 0 : parent.height * 0.15;
            opacity: operationcontrol.state == "" ? 0 : 1;
            anchors.top: operationcontrol.bottom
            anchors.topMargin: parent.height*0.02;
            anchors.left: parent.left
            anchors.leftMargin: ( parent.width - width ) /2
            color: "#00ffffff"

            Rectangle {
                color: "#00ffffff"
                opacity: 1
                border.color: "white"
                border.width: 1
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                visible: applistview.visible ? false : true
                radius: 5

                Text {
                    anchors.centerIn: parent
                    anchors.margins: 4
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    color: "white"
                    text: "no Open Application(s)"
                    font.pixelSize: 20;
                    font.bold: true
                    }
                }

            GridView {
                id: applistview
                anchors.fill: parent
                visible: count != 0 ? true : false
                clip: true
                flow: GridView.TopToBottom

                cellWidth: parent.width * 0.32 //3 icons
                cellHeight: parent.height * 0.9;

                model: appModel
                delegate: Component {
                    id: listviewitem

                        Rectangle {
                          id: toolbaritem
                          anchors.margins: 5
                          width: applistview.cellWidth * 0.9;
                          height: applistview.cellHeight * 0.8;
                          color: isselected ? "#0d6dad" : "#00ffffff";
                          radius: 5
                          border.color: "white"
                          border.width: 1

                            Item {
                                anchors.centerIn: parent
                                width: parent.width * 0.9
                                height: parent.height * 0.7

                                Rectangle {
                                    color: "black"
                                    opacity: 0.6
                                    anchors.fill: parent
                                    }

                                    Text {
                                        anchors.fill: parent
                                        anchors.margins: 1
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        elide: Text.ElideRight
                                        color: "white"
                                        text: name
                                        font.pixelSize: 15;
                                        font.bold: true
                                        opacity:1
                                        }
                                    }


                            MouseArea {
                                anchors.fill: parent
                                onPressed: {
                                    appModel.updateappstocloselist(index);
                                    }
                                }
                            }
                        }
                }

            Behavior on height {
                NumberAnimation{duration: 250}
                }
            Behavior on opacity {
                NumberAnimation{duration: 250}
                }
            }

        Rectangle {
            id: startitem
            anchors.top: applist.bottom
            anchors.topMargin: 10;
            anchors.left: parent.left
            anchors.leftMargin: (parent.width - width) / 2
            width: parent.width * 0.8;
            height: parent.height * 0.07;
            //color: "green"
            radius: 5

            gradient: Gradient {
                GradientStop { id: gradientStop; position: 0.0; color: "green" }
                GradientStop { position: 1.0; color: "#11ff11" }
            }

            SystemPalette { id: palette }

            Item {
                id: title
                width: parent.width;
                height: parent.height
                z:2
                Text {
                    id: loadingText2
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black"
                    font.bold: true
                    font.pixelSize: 20
                    text: "Start Timer"
                    }
                }//title

            MouseArea {
                id: startbutton
                anchors.fill: parent

                onReleased: {
                    if(hourslist.currentIndex == 0 && minuteslist.currentIndex == 0)
                        {
                        warningdialog.text = "0 minutes? Try setting higer duration."
                        }
                    else if (operationcontrol.state == "closeapps" && !appModel.canlaunch())
                        {
                        warningdialog.text = "Choose applications to close."
                        }
                    else {

                        if(operationcontrol.state == "")
                            appModel.p_operation = 1;
                        else
                            appModel.p_operation = 0;

                        appModel.p_hours = hourslist.currentIndex;
                        appModel.p_minutes = minuteslist.currentIndex;
                        appModel.StartOperation();
                        }
                    }
                }

            states: State {
                name: "pressed"
                when: startbutton.pressed
                PropertyChanges { target: gradientStop; color: palette.dark }
                }
           }//start button

        Behavior on x {
            NumberAnimation{duration: 100}
            }
        }

    Item {
        id: dialogcontainer
        width: parent.width
        height: parent.height
        anchors.left: uicontrols.right

        Item {
            anchors.centerIn: parent
            width: mother.width * 0.9
            height: mother.height * 0.5

            Rectangle {
                anchors.fill: parent
                color: "black"
                radius: 5
                opacity: 1
                }

            Text {
                id: message
                anchors.top: parent.top
                anchors.topMargin: 15
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - width) / 2
                width: parent.width * 0.75
                height: parent.height * 0.1
                color: "white"
                font.bold: true
                font.pixelSize: 20
                font.wordSpacing: 6
                wrapMode: Text.Wrap
                text: appModel.p_remainingtime;
                }

            Item {
                id: remtimecontainer
                width: parent.width * 0.75
                height: parent.height * 0.1
                anchors.top: message.bottom
                //anchors.topMargin: parent.height * 0.15;
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - width) / 2

                Text {
                    id: remhours
                    anchors.left: parent.left
                    width: parent.width * 0.2
                    height: parent.height
                    color: "white"
                    font.pixelSize: 50
                    text: appModel.p_remhours;
                    }

                Text {
                    id: remhoursstring
                    anchors.left: remhours.right
                    anchors.leftMargin: 5
                    width: parent.width * 0.25
                    height: parent.height
                    color: "white"
                    font.pixelSize: 20
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignLeft
                    text: "hours";
                    }

                Text {
                    id: remmins
                    anchors.left: remhoursstring.right
                    width: parent.width * 0.25
                    height: parent.height
                    color: "white"
                    font.pixelSize: 50
                    text: appModel.p_remmins;
                    }

                Text {
                    id: remminsstring
                    anchors.left: remmins.right
                    width: parent.width * 0.25
                    height: parent.height
                    color: "white"
                    font.pixelSize: 20
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignLeft
                    text: "mins.";
                    }
                }

            Rectangle {
                id: dismissitem
                anchors.top: remtimecontainer.bottom
                anchors.topMargin: parent.height * 0.15;
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - width) / 2
                width: parent.width * 0.8;
                height: 50;//parent.height * 0.1;
                radius: 5

                gradient: Gradient {
                    GradientStop { id: gradientStopx; position: 0.0; color: "#d40000" }
                    GradientStop { position: 0.4; color: "#ff2a2a" }
                    }

                SystemPalette { id: palettex }

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
                    PropertyChanges { target: gradientStopx; color: palettex.dark }
                    }
               }//dismiss button

            Rectangle {
                id: snoozeitem
                anchors.top: dismissitem.bottom
                anchors.topMargin: parent.height * 0.1;
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - width) / 2
                width: parent.width * 0.8;
                height: 50;//parent.height * 0.1;
                radius: 5

                gradient: Gradient {
                    GradientStop { id: gradientStop2x; position: 0.0; color: "green" }
                    GradientStop { position: 1.0; color: "#11ff11" }
                    }

                SystemPalette { id: palette2x }

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
                        text: "Wait 15mins more"
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
                    PropertyChanges { target: gradientStop2x; color: palette2x.dark }
                    }
               }//snooze button
            }

    }


    Image {
        id: exit
        source: "exit.png"
        width: 60
        height: 60
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        scale: exitbuttonMA.pressed ? 0.7 : 1.0
        onScaleChanged: {
            if(scale == 1.0)
                Qt.quit();
            }

        MouseArea {
                id: exitbuttonMA
                anchors.fill: parent
                }
        }

    CustomWarning {
        id: warningdialog
        anchors.centerIn: parent
    }

    function qmlviewabouttobeshown() {
        //console.log("viewabouttobeshown >")
        minuteslist.currentIndex = appModel.p_minutes;
        hourslist.currentIndex = appModel.p_hours;
        operationcontrol.state = appModel.p_operation == 1? "" : "closeapps";
        //console.log("viewabouttobeshown <")
    }
}
