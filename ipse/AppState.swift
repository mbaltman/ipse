import Foundation

class AppState: ObservableObject
{
    var reports : [CheckInReport] = []
    
    @Published
    public var isOnboarded = false

    init()
    {
        checkIsOnboarded()
    }

    public func checkIsOnboarded()
    {
        let traits = UserDefaultsManager.retrieveSelectedTraits()
        let times = UserDefaultsManager.retrieveSelectedTimes()
        isOnboarded = !traits.isEmpty && !times.isEmpty
    }
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
    
    func logNewReport(report: CheckInReport)
    {
        reports.append(report)
    }
    
}
