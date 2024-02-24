import Foundation

class AppState: ObservableObject
{
    var reports : [CheckInReport] = []
    
    func hasPendingCheckIn() -> Bool
    {
        return true
    }
    
    func getCurrentPartOfDay() -> PartOfDay
    {
        return .evening
    }
    
    func getMostRecentReport() -> CheckInReport?
    {
        return reports.last
    }
    
    func loadInReports()
    {
        reports.append(CheckInReport(goal: "Go for a 20 min walk ", partOfDay: .afternoon, timeCreated: Date.now))
    }
    
}
