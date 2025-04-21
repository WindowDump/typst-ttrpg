
// Flexoki - https://stephango.com/flexoki
// imported from https://github.com/kepano/flexoki

// Light mode:
// - background: paper
// - text: black
// - highlighted text: color-600

// Dark mode:
// - background: black
// - text: base-200
// - highlighted text: color-400

// Base
#let flexoki-paper = rgb(255, 252, 240)
#let base-50 = rgb(242, 240, 229)
#let base-100 = rgb(230, 228, 217)
#let base-150 = rgb(218, 216, 206)
#let base-200 = rgb(206, 205, 195)
#let base-300 = rgb(183, 181, 172)
#let base-400 = rgb(159, 157, 150)
#let base-500 = rgb(135, 133, 128)
#let base-600 = rgb(111, 110, 105)
#let base-700 = rgb(87, 86, 83)
#let base-800 = rgb(64, 62, 60)
#let base-850 = rgb(52, 51, 49)
#let base-900 = rgb(40, 39, 38)
#let base-950 = rgb(28, 27, 26)
#let flexoki-black = rgb(16, 15, 15)

// Red
#let red-50 = rgb(255, 225, 213)
#let red-100 = rgb(255, 202, 187)
#let red-150 = rgb(253, 178, 162)
#let red-200 = rgb(248, 154, 138)
#let red-300 = rgb(232, 112, 95)
#let red-400 = rgb(209, 77, 65)
#let red-500 = rgb(192, 62, 53)
#let red-600 = rgb(175, 48, 41)
#let red-700 = rgb(148, 40, 34)
#let red-800 = rgb(108, 32, 28)
#let red-850 = rgb(85, 27, 24)
#let red-900 = rgb(62, 23, 21)
#let red-950 = rgb(38, 19, 18)

// Orange
#let orange-50 = rgb(255, 231, 206)
#let orange-100 = rgb(254, 211, 175)
#let orange-150 = rgb(252, 193, 146)
#let orange-200 = rgb(249, 174, 119)
#let orange-300 = rgb(236, 139, 73)
#let orange-400 = rgb(218, 112, 44)
#let orange-500 = rgb(203, 97, 32)
#let orange-600 = rgb(188, 82, 21)
#let orange-700 = rgb(157, 67, 16)
#let orange-800 = rgb(113, 50, 13)
#let orange-850 = rgb(89, 41, 13)
#let orange-900 = rgb(64, 32, 13)
#let orange-950 = rgb(39, 24, 14)

// Yellow
#let yellow-50 = rgb(250, 238, 198)
#let yellow-100 = rgb(246, 226, 160)
#let yellow-150 = rgb(241, 214, 126)
#let yellow-200 = rgb(236, 203, 96)
#let yellow-300 = rgb(223, 180, 49)
#let yellow-400 = rgb(208, 162, 21)
#let yellow-500 = rgb(190, 146, 7)
#let yellow-600 = rgb(173, 131, 1)
#let yellow-700 = rgb(142, 107, 1)
#let yellow-800 = rgb(102, 77, 1)
#let yellow-850 = rgb(80, 61, 2)
#let yellow-900 = rgb(58, 45, 4)
#let yellow-950 = rgb(36, 30, 8)

// Green
#let green-50 = rgb(237, 238, 207)
#let green-100 = rgb(221, 226, 178)
#let green-150 = rgb(205, 213, 151)
#let green-200 = rgb(190, 201, 126)
#let green-300 = rgb(160, 175, 84)
#let green-400 = rgb(135, 154, 57)
#let green-500 = rgb(118, 141, 33)
#let green-600 = rgb(102, 128, 11)
#let green-700 = rgb(83, 105, 7)
#let green-800 = rgb(61, 76, 7)
#let green-850 = rgb(49, 61, 7)
#let green-900 = rgb(37, 45, 9)
#let green-950 = rgb(26, 30, 12)

// Cyan
#let cyan-50 = rgb(221, 241, 228)
#let cyan-100 = rgb(191, 232, 217)
#let cyan-150 = rgb(162, 222, 206)
#let cyan-200 = rgb(135, 211, 195)
#let cyan-300 = rgb(90, 189, 172)
#let cyan-400 = rgb(58, 169, 159)
#let cyan-500 = rgb(47, 150, 141)
#let cyan-600 = rgb(36, 131, 123)
#let cyan-700 = rgb(28, 108, 102)
#let cyan-800 = rgb(22, 79, 74)
#let cyan-850 = rgb(20, 63, 60)
#let cyan-900 = rgb(18, 47, 44)
#let cyan-950 = rgb(16, 31, 29)

// Blue
#let blue-50 = rgb(225, 236, 235)
#let blue-100 = rgb(198, 221, 232)
#let blue-150 = rgb(171, 207, 226)
#let blue-200 = rgb(146, 191, 219)
#let blue-300 = rgb(102, 160, 200)
#let blue-400 = rgb(67, 133, 190)
#let blue-500 = rgb(49, 113, 178)
#let blue-600 = rgb(32, 94, 166)
#let blue-700 = rgb(26, 79, 140)
#let blue-800 = rgb(22, 59, 102)
#let blue-850 = rgb(19, 48, 81)
#let blue-900 = rgb(18, 37, 59)
#let blue-950 = rgb(16, 26, 36)

// Purple
#let purple-50 = rgb(240, 234, 236)
#let purple-100 = rgb(226, 217, 233)
#let purple-150 = rgb(211, 202, 230)
#let purple-200 = rgb(196, 185, 224)
#let purple-300 = rgb(166, 153, 208)
#let purple-400 = rgb(139, 126, 200)
#let purple-500 = rgb(115, 94, 181)
#let purple-600 = rgb(94, 64, 157)
#let purple-700 = rgb(79, 54, 133)
#let purple-800 = rgb(60, 42, 98)
#let purple-850 = rgb(49, 35, 78)
#let purple-900 = rgb(38, 28, 57)
#let purple-950 = rgb(26, 22, 35)

// Magenta
#let magenta-50 = rgb(254, 228, 229)
#let magenta-100 = rgb(252, 207, 218)
#let magenta-150 = rgb(249, 185, 207)
#let magenta-200 = rgb(244, 164, 194)
#let magenta-300 = rgb(228, 125, 168)
#let magenta-400 = rgb(206, 93, 151)
#let magenta-500 = rgb(183, 69, 131)
#let magenta-600 = rgb(160, 47, 111)
#let magenta-700 = rgb(135, 40, 94)
#let magenta-800 = rgb(100, 31, 70)
#let magenta-850 = rgb(79, 27, 57)
#let magenta-900 = rgb(57, 23, 43)
#let magenta-950 = rgb(36, 19, 29)
