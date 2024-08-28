import Foundation

public extension Date {
    
    func parseString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func equals(_ other: Date, components: Set<Calendar.Component>) -> Bool {
        let calendar = Calendar.current
        let selfComponents = calendar.dateComponents(components, from: self)
        let otherComponents = calendar.dateComponents(components, from: other)
        return selfComponents == otherComponents
    }
    
    func percent(from: Date, to: Date) -> Double {
        (self.timeIntervalSince1970 - from.timeIntervalSince1970) / (to.timeIntervalSince1970 - from.timeIntervalSince1970)
    }
    
    func diff(_ components: Set<Calendar.Component>, other: Date) -> DateComponents {
        Calendar.current.dateComponents(components, from: self, to: other)
    }
    
    func diff(_ components: Set<Calendar.Component>, other: Date) -> Date {
        Calendar.current.dateComponents(components, from: self, to: other).date!
    }
    
    subscript(components: Calendar.Component) -> Int? {
        Calendar.current.dateComponents([components], from: self).value(for: components)
    }
}
