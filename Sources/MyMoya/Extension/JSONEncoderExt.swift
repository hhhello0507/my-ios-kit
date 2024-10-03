import Foundation
import MyDateUtil

public extension JSONEncoder {
    static var myEncoder: JSONEncoder {
        let e = JSONEncoder()
        e.dateEncodingStrategy = .custom { date, encoder in
            var container = encoder.singleValueContainer()
            let dateStr = DateFormatter(type: .isoDateTimeMilliSec).string(from: date)
            try container.encode(date)
        }
        return e
    }
}
