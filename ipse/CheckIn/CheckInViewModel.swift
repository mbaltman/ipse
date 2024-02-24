import Foundation

class CheckInViewModel: ObservableObject
{
    @Published
    private(set) var currentStep = 1
    
    let selectedTraits: [Trait]
    
    init()
    {
        selectedTraits = UserDefaultsManager.retrieveSelectedTraits()
    }
    public func goToNextStep()
    {
        currentStep += 1
    }
}
