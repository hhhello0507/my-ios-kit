import SwiftUI

public enum GrowIconography {
    case add
    case addRing
    case arrowDown
    case arrowLeft
    case arrowRight
    case arrowUp
    case baekjoon
    case chat
    case check
    case closeFill
    case closeLine
    case closeRing
    case detailHorizontal
    case detailVertical
    case expandDown
    case expandLeft
    case expandRight
    case expandStopDown
    case expandStopLeft
    case expandStopRight
    case expandStopUp
    case expandUp
    case github
    case heart
    case hide
    case home
    case logout
    case moon
    case notification
    case person
    case ping
    case radio
    case radioUnselected
    case send
    case setting
    case show
    case write
    case addFill
    
    var icon: String {
        switch self {
        case .add: "add"
        case .addRing: "addRing"
        case .arrowDown: "arrowDown"
        case .arrowLeft: "arrowLeft"
        case .arrowRight: "arrowRight"
        case .arrowUp: "arrowUp"
        case .baekjoon: "baekjoon"
        case .chat: "chat"
        case .check: "check"
        case .closeFill: "closeFill"
        case .closeLine: "closeLine"
        case .closeRing: "closeRing"
        case .detailHorizontal: "detailHorizontal"
        case .detailVertical: "detailVertical"
        case .expandDown: "expandDown"
        case .expandLeft: "expandLeft"
        case .expandRight: "expandRight"
        case .expandStopDown: "expandStopDown"
        case .expandStopLeft: "expandStopLeft"
        case .expandStopRight: "expandStopRight"
        case .expandStopUp: "expandStopUp"
        case .expandUp: "expandUp"
        case .github: "github"
        case .heart: "heart"
        case .hide: "hide"
        case .home: "home"
        case .logout: "logout"
        case .moon: "moon"
        case .notification: "notification"
        case .person: "person"
        case .ping: "ping"
        case .radio: "radio"
        case .radioUnselected: "radioUnselected"
        case .send: "send"
        case .setting: "setting"
        case .show: "show"
        case .write: "write"
        case .addFill: "addFill"
        }
    }
}
