import Foundation
class UserDefaultsManager {
    static func saveSelectedTimes(_ times: [PartOfDay]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(times) {
            UserDefaults.standard.set(encoded, forKey: "selectedTimes")
        }
    }
    
    static func retrieveSelectedTimes() -> [PartOfDay] {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: "selectedTimes"),
           let times = try? decoder.decode([PartOfDay].self, from: data) {
            return times
        }
        return []
    }
    
    static func saveSelectedTraits(_ traits: [Trait]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(traits) {
            UserDefaults.standard.set(encoded, forKey: "selectedTraits")
        }
    }
    
    static func retrieveSelectedTraits() -> [Trait] {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: "selectedTraits"),
           let traits = try? decoder.decode([Trait].self, from: data) {
            return traits
        }
        return []
    }
}
