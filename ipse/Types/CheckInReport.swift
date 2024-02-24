import Foundation

class CheckInReport
{
    let goal: String?
    let partOfDay: PartOfDay
    let timeCreated: Date
    
    init(goal: String?, partOfDay: PartOfDay, timeCreated: Date) {
        self.goal = goal
        self.partOfDay = partOfDay
        self.timeCreated = timeCreated
    }
}
