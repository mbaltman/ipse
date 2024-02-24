import Foundation
import SwiftUI
class OnboardingViewModel: ObservableObject
{
    @Published
    private(set) var currentStep = 1
    
    @Published
    var selectedTimes: [PartOfDay] = []
    
    @Published
    var selectedTraits: [Trait] = []
    
    func goToNextStep() {
            currentStep = 2 // Increment or set to specific value based on the flow
    }
    
    func completeOnboarding()
    {
        
    }
}
