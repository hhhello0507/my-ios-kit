import SwiftUI

public protocol Iconable {
    var rawValue: String { get }
}

public enum Icons {
    public enum Detail: String, Iconable {
        case Detail
    }
    public enum Arrow: String, Iconable {
        case ExpandArrow, NormalArrow, StopArrow, CurveArrow
    }
    public enum Cross: String, Iconable {
        case CrossLine, CrossRing, CrossFill
    }
    public enum Add: String, Iconable {
        case AddLine, AddRing, AddFill
    }
    public enum Exclamation: String, Iconable {
        case ExclamationLine, ExclamationFill
    }
    public enum Mark: String, Iconable {
        case HeartLine, HeartFill
        case RadioLine, RadioFill
        case CheckLine, CheckRing, CheckFill
        case BookmarkLine, BookmarkFill
    }
    public enum Visible: String, Iconable {
        case Show, Hide
    }
    public enum Alarm: String, Iconable {
        case Alarm, AlarmDisable
    }
    public enum Feature: String, Iconable {
        case Book
        case Calendar
        case Camera
        case Chat
        case Crown
        case Home
        case Manage
        case Moon
        case Person
        case Ping
        case Send
        case Setting
        case Star
        case Trash
        case Utensils
    }
    public enum ETC: String, Iconable {
        case AddEmoji
        case Blank
        case Copy
        case File
        case Logout
        case LoudSpeaker
        case Photo
        case Search
        case Substack
        case Write
    }
    public enum Color: String, Iconable {
        case AppleLogo
        case GoogleLogo
    }
}
