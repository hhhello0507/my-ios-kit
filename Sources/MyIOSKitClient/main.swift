import SwiftUI
import MyDesignSystem
import MyMoya
import MyFoundationUtil
import MyUIKitExt
import Moya
import Combine

public enum MealEndpoint: MyTarget {
    public var baseURL: URL {
        URL(string: "http://15.164.12.91:1234")!
    }
    
    case fetchMeals(schoolId: Int)
}

extension MealEndpoint {
    public var host: String {
        "meals"
    }
    
    public var route: Route {
        switch self {
        case .fetchMeals(let schoolId): .get("\(schoolId)")
        }
    }
}

var sub = Set<AnyCancellable>()

let run = DefaultNetRunner(provider: .init(), authProvider: .init())

func request() {
    print("Net")
    run
        .deepDive(MealEndpoint.fetchMeals(schoolId: 1393), res: String.self)
        .sink {
            print("Result : \($0)")
        } receiveValue: {
            print("Value : \($0)")
        }
        .store(in: &sub)

    print("Net")
}

request()

RunLoop.main.run(until: Calendar.current.date(byAdding: .second, value: 10, to: .now)!)
