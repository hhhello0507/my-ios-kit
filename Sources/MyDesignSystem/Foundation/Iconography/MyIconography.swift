import SwiftUI

public enum MyIconography {
    case add
    case addRing
    case addFill
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
    case imageLine
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
    
    var icon: String {
        switch self {
        case .add: "Add"
        case .addRing: "AddRing"
        case .arrowDown: "ArrowDown"
        case .arrowLeft: "ArrowLeft"
        case .arrowRight: "ArrowRight"
        case .arrowUp: "ArrowUp"
        case .baekjoon: "Baekjoon"
        case .chat: "Chat"
        case .check: "Check"
        case .closeFill: "CloseFill"
        case .closeLine: "CloseLine"
        case .closeRing: "CloseRing"
        case .detailHorizontal: "DetailHorizontal"
        case .detailVertical: "DetailVertical"
        case .expandDown: "ExpandDown"
        case .expandLeft: "ExpandLeft"
        case .expandRight: "ExpandRight"
        case .expandStopDown: "ExpandStopDown"
        case .expandStopLeft: "ExpandStopLeft"
        case .expandStopRight: "ExpandStopRight"
        case .expandStopUp: "ExpandStopUp"
        case .expandUp: "ExpandUp"
        case .imageLine: "ImageLine"
        case .github: "Github"
        case .heart: "Heart"
        case .hide: "Hide"
        case .home: "Home"
        case .logout: "Logout"
        case .moon: "Moon"
        case .notification: "Notification"
        case .person: "Person"
        case .ping: "Ping"
        case .radio: "Radio"
        case .radioUnselected: "RadioUnselected"
        case .send: "Send"
        case .setting: "Setting"
        case .show: "Show"
        case .write: "Write"
        case .addFill: "AddFill"
        }
    }
}
