class PartOfDay: Identifiable, Equatable
{
    static func == (lhs: PartOfDay, rhs: PartOfDay) -> Bool {
        lhs.title == rhs.title
    }
    
    static let morning = PartOfDay(title: "morning", iconName: "sun.horizon")
    static let afternoon = PartOfDay(title: "afternoon", iconName: "sun.max")
    static let evening = PartOfDay(title: "evening", iconName: "moon")


    static let allTimes = [morning, afternoon, evening]
    let title: String
    let iconName: String
    private init(title: String, iconName: String)
    {
        self.title = title
        self.iconName = iconName
    }
}
