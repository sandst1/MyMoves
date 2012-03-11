/*
 * MyMoves - Configurable gestures for Harmattan
 * Copyright (C) 2011 Topi Santakivi <topi.santakivi@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
import QtQuick 1.1
import com.meego 1.0

BlackPage {
    id: addMove

    Column {
        anchors.centerIn: parent
        spacing: 15
        Rectangle {
            id: gesture
            width: 220
            height: 220
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "#ffffff"
            border.width: 3
            color: "#000000"
            radius: 5
            Image {
              width: 200
              height: 200
              anchors.centerIn: parent
              source: gestList.selectedGesture
            }
        }

        MyText {
            id: app
            anchors.horizontalCenter: parent.horizontalCenter
            text: appList.selectedApp=="" ? "No app selected" : appList.selectedApp
            font.pointSize: 24
        }

        BlackButton {
            id: selectGest
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Select gesture"
            onClicked: {
                gestList.visible = true;
            }
        }
        BlackButton {
            id: selectApp
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Select app"
            onClicked: {
                appList.visible = true;
            }
        }
        BlackButton {
            id: done
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Done"
            onClicked: {
                // TODO: CHECK that both gesture & app are selected!
                // Save gesture
                GestureListModel.saveItem(gestList.selectedIndex, appList.selectedApp, appList.selectedCmd);
                pageStack.pop();
            }
        }
        BlackButton {
            id: cancel
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Cancel"
            onClicked: {
                pageStack.pop();
            }
        }
    }

    AppList {
        id: appList
        visible: false
    }

    GestureList {
        id: gestList
        visible: false
    }
}
