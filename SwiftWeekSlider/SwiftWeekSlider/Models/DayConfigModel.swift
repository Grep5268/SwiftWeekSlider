import Foundation

public struct DayConfigModel {
    let date: Date
    let isHoliday: Bool
    let onClick: (() -> ())?
    
    public init(date: Date, isHoliday: Bool = false, onClick: (() -> ())? = nil) {
        self.date = date
        self.isHoliday = isHoliday
        self.onClick = onClick
    }
}

