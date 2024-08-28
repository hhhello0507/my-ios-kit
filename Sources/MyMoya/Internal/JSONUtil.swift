import Foundation

let localDateTimeMSFormatter = DateFormatter("yyyy-MM-dd'T'HH:mm:ss.SSSSSS")
let localDateTimeFormatter = DateFormatter("yyyy-MM-dd'T'HH:mm:ss")
let localDateFormatter = DateFormatter("yyyy-MM-dd")
let localDateFormatter1 = DateFormatter("yyyyMMdd")

let dateEncodingStrategy = JSONEncoder.DateEncodingStrategy.custom { date, encoder in
    var container = encoder.singleValueContainer()
    let dateStr = localDateTimeMSFormatter.string(from: date)
    try container.encode(date)
}

let dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.custom { decoder in
    let container = try decoder.singleValueContainer()
    let dateStr = try container.decode(String.self)
    
    return if let date = localDateTimeMSFormatter.date(from: dateStr) {
        date
    } else if let date = localDateTimeFormatter.date(from: dateStr) {
        date
    } else if let date = localDateFormatter.date(from: dateStr) {
        date
    } else if let date = localDateFormatter1.date(from: dateStr) {
        date
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
