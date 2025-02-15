import SwiftUI

// 사용 예시
/*
 Text("Example")
    .foregroundStyle(Color.MoaBa.purple)
 */

// #787878 = DarkGray
// #A4A4A4 = Gray
// #C4C4C4 = LightGray

// Purple이라는 게 겹쳐서 만듦
// 만약 그냥 Color.~~ 에 lightPurple이나 다른게 뜨면 써도 무관

extension Color {
    enum MoaBa {}
}

extension Color.MoaBa {
    /// #AF52DE
    static let purple = Color("Purple")
    /// #E8DEF8
    static let lightPurple = Color("LightPurple")
    /// #CCC2DC
    static let grayPurple = Color(.grayPurple)
    /// #787878
    static let darkGray = Color("DarkGray")
    /// #A4A4A4
    static let gray = Color("Gray")
    /// #C4C4C4
    static let lightGray = Color("LightGray")
    /// #FFFFFF
    static let white = Color("White")
    /// #000000
    static let black = Color("Black")
}
