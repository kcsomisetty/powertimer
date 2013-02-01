#PowerTimer is timer utility app for symbian smartphones
#to schedule turnoff's and closing app's automatically
#Copyright (C) 2010 Krishna Somisetty

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#PowerTimer is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Add files and directories to ship with the application 
# by adapting the examples below.
# file1.source = myfile
# dir1.source = mydir
DEPLOYMENTFOLDERS = # file1 dir1

symbian:TARGET.UID3 =

cusrule.pkg_prerules = \
"%{\"Somisetty\"}"\
" "\
:\"Somisetty\""

DEPLOYMENT += cusrule

symbian {
    TARGET.UID3 = 0x2003AFFB #0xE2EC32EA
    TARGET.CAPABILITY += PowerMgmt SwEvent
    }

DEPLOYMENT.display_name = PowerTimer
DEPLOYMENT.installer_header = 0x2002CCCF

VERSION = 2.0.0

# Allow network access on Symbian
 symbian:LIBS += -lcone -leikcore -lapgrfx -lws32 -lavkon
# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
# CONFIG += mobility
# MOBILITY +=

QT += declarative
#CONFIG += mobility
#MOBILITY += multimedia
SOURCES += main.cpp \
    model.cpp

# Please do not modify the following two lines. Required for deployment.
include(deployment.pri)
qtcAddDeployment()

OTHER_FILES += \
    ui.qml \
    ParallaxView.qml \
    TextButton.qml \
    CustomWarning.qml

RESOURCES += \
    powertimer.qrc

HEADERS += \
    model.h \
    config.h
