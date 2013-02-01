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

Item {
    id: root

    //property alias background: background.source
    property int currentIndex: 0;
    default property alias content: visualModel.children
   // property alias selectorvisible: selector.opacity

    ListView {
        id: list
        anchors.fill: parent
        cacheBuffer: 160

        currentIndex: root.currentIndex
        onCurrentIndexChanged: root.currentIndex = currentIndex

        orientation: Qt.Vertical
        boundsBehavior: Flickable.DragOverBounds
        model: VisualItemModel { id: visualModel }

        highlightRangeMode: ListView.StrictlyEnforceRange
        snapMode: ListView.SnapOneItem
        }
    }
