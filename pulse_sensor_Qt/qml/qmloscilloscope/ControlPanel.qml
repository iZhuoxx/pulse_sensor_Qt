/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Charts module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtQuick.Layouts 1.15

ColumnLayout {
    spacing: 8
    Layout.fillHeight: true

    property var displayState: [true, false]

    Text {
        text: "Display"
        font.pointSize: 18
        color: "white"
    }

    DisplayButton {
        id: ecgButton
        text: "ECG"

        onClicked: {
            if (parent.displayState[0] === true && parent.displayState[1] === true) {
                parent.displayState = [true, false]
            } else if (parent.displayState[0] === true && parent.displayState[1] === false) {
                parent.displayState = [false, false]
            } else if (parent.displayState[0] === false && parent.displayState[1] === true) {
                parent.displayState = [true, true]
            } else {
                parent.displayState = [true, false]
            }

        }
    }

    DisplayButton {
        id: heartRateButton
        text: "HR"

        onClicked: {
            if (parent.displayState[0] === true && parent.displayState[1] === true) {
                parent.displayState = [false, true]
            } else if (parent.displayState[0] === true && parent.displayState[1] === false) {
                parent.displayState = [true, true]
            } else if (parent.displayState[0] === false && parent.displayState[1] === true) {
                parent.displayState = [false, false]
            } else {
                parent.displayState = [false, true]
            }
        }
    }

}
