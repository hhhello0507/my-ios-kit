import SwiftUI

public extension BottomTabType {
    
    var image: String {
        switch self {
        case .Home: "home"
        case .Forum: "chat"
        case .GithubRank: "github"
        case .BaekjoonRank: "baekjoon"
        case .Profile: "person"
        }
    }
    
    var label: String {
        switch self {
        case .Home: "홈"
        case .Forum: "포럼"
        case .GithubRank: "Github"
        case .BaekjoonRank: "백준"
        case .Profile: "프로필"
        }
    }
}
