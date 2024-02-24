import Foundation

class CheckInViewModel: ObservableObject
{
    @Published
    private(set) var currentStep = 1
    
    let selectedTraits: [Trait]
    
    @Published
    var didLogTraits = false
    
    private var loggedTraits : [Trait: Int] = [:]
    
    init()
    {
        selectedTraits = UserDefaultsManager.retrieveSelectedTraits()
    }
    public func goToNextStep()
    {
        currentStep += 1
    }
    
    public func addLoggedTraitValue(forTrait trait: Trait, value: Int)
    {
        loggedTraits[trait] = value
        if loggedTraits.count == selectedTraits.count
        {
            didLogTraits = true
        }
    }
}
