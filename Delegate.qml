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
import Qt 4.7

Component {

   Rectangle {
      id: itementry
      color: "#aaFFFFFF"
      border.color: "white"
      border.width: 1
      width: 50
      height: 50

      Text {
             text: number
             anchors.centerIn: parent
//             anchors.horizontalCenter: parent.horizontalCenter
//             anchors.topMargin: 5
             horizontalAlignment: Text.AlignHCenter
             color: "black"
             font.bold: true
             font.pixelSize: 25
             //elide: "ElideRight"
//             wrapMode: Text.WordWrap
//             width: parent.width * 0.8
//             height: parent.height * 0.3
            }

      MouseArea {
          id: itementryMA
          anchors.fill: parent
          onReleased: {
//                      if(funcname == "initiaterefresh")
//                             mother.initiaterefresh();
//                      else if(funcname == "deletefolder")
//                          mother.deletefolder();
//                      else if(funcname == "sharefolder")
//                             mother.sharefolder();
//                      else if(funcname == "showparentfolder")
//                          mother.showparentfolder();
//                      else if(funcname == "downloadfolder")
//                          mother.downloadfolder();
//                      else if(funcname == "quit")
//                          mother.quit();
//                      else {}
                      }
                }
        }
}

