import Foundation

public extension DateFormatter {
    convenience init(type: DateFormatterType, locale: Locale = Locale(identifier: "ko_KR")) {
        self.init()
        self.dateFormat = type.rawValue
        self.locale = locale
    }
    
}

public enum DateFormatterType: String, CaseIterable {
    /// The ISO8601 formatted date "yyyy-MM-dd" i.e. 1997-07-16
    case isoDate = "yyyy-MM-dd"
    /// The ISO8601 formatted date and time "yyyy-MM-dd'T'HH:mm" i.e. 1997-07-16T19:20
    case isoDateTime = "yyyy-MM-dd'T'HH:mm"
    /// The ISO8601 formatted date, time and sec "yyyy-MM-dd'T'HH:mm:ss" i.e. 1997-07-16T19:20:30
    case isoDateTimeSec = "yyyy-MM-dd'T'HH:mm:ss"
    /// The ISO8601 formatted date, time and millisec "yyyy-MM-dd'T'HH:mm:ss.SSSSSS" i.e. 1997-07-16T19:20:30.45+01:00
    case isoDateTimeMilliSec = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
}

let dateEncodingStrategy = JSONEncoder.DateEncodingStrategy.custom { date, encoder in
    var container = encoder.singleValueContainer()
    let dateStr = DateFormatter(type: .isoDateTimeMilliSec).string(from: date)
    try container.encode(date)
}

let dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.custom { decoder in
    let container = try decoder.singleValueContainer()
    let dateStr = try container.decode(String.self)
    let dateFormatters = DateFormatterType.allCases
    if let date = dateFormatters.compactMap({ DateFormatter(type: $0).date(from: dateStr) }).first {
        return date
    } else {
        let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Invalid date format")
        throw DecodingError.dataCorrupted(context)
    }
}

let myDecoder = {
    let d = JSONDecoder()
    d.dateDecodingStrategy = dateDecodingStrategy
    return d
}()

let myEncoder = {
    let e = JSONEncoder()
    e.dateEncodingStrategy = dateEncodingStrategy
    return e
}()
