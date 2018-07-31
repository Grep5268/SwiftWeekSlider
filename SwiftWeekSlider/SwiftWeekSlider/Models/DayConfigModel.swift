import Foundation

public struct DayConfigModel {
    public var date: Date
    public var highlighted: Bool
    public var onClick: (() -> ())?
    
    public init(date: Date, highlighted: Bool = false, onClick: (() -> ())? = nil) {
        self.date = date
        self.highlighted = highlighted
        self.onClick = onClick
    }
}

