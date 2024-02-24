import Foundation

class CheckInViewModel: ObservableObject
{
    @Published
    private(set) var currentStep = 1
    
    public func goToNextStep()
    {
        currentStep += 1
    }
}
