class Trait: Identifiable, Equatable, Codable
{
    static func == (lhs: Trait, rhs: Trait) -> Bool {
        lhs.title == rhs.title
    }
    
    static let energized = Trait(title: "tired vs energized")
    static let relaxed = Trait(title: "physically tense vs relaxed")
    static let focused = Trait(title: "distracted vs focused")
    static let calm = Trait(title: "stressed vs calm")
    static let friendly = Trait(title: "irritable vs friendly")

    static let allTraits = [energized, relaxed, focused, calm, friendly]
    let title: String
    private init(title: String)
    {
        self.title = title
    }
    
    
}
