import SwiftUI

struct OnboardingView: View {
    @ObservedObject
    var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.currentStep == 1 {
                onboardingStep1
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            } else if viewModel.currentStep == 2 {
                onboardingStep2
                    // Adjusting the transition for step2 to ensure it comes from the right
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
        .animation(.default, value: viewModel.currentStep)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .edgesIgnoringSafeArea(.all)
    }


    private var onboardingStep1: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            VStack(alignment: .center) {
                Text("Welcome to Ipse")
                    .font(Font.custom(Constants.readexFont, size: 36).bold())
                    .foregroundColor(Color("ipseBlack"))
                Text("What gets measured, gets managed")
                    .font(Constants.bodyFont)
                    .foregroundColor(Color("ipseBlack"))
            }
            Text("The following questions will set up a series of daily check-ins. The goal of this tool is to build self-awareness of how you are feeling throughout the day.")
                .font(Constants.bodyFont)
                .foregroundColor(Color("ipseBlack"))
                .padding()
                .background(Color("ipseWhite"))
                .cornerRadius(Constants.textFieldRounding)
                .shadow(color: Color("ipseBlack"), radius: 0, x: 5, y: 5)
                .padding()
            ContinueButton(action: {
                withAnimation {
                    self.viewModel.goToNextStep()
                }
            }, width: 120, height: 40)
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: Constants.horizontalPadding, bottom: 0, trailing: Constants.horizontalPadding))

    }

    private var onboardingStep2: some View {
        VStack(alignment: .center)
        {
            Spacer()
            Text("When would you like to check in?")
                .font(Constants.titleFont) // Make sure Constants.titleFont is defined
                .foregroundColor(Color("ipseBlack"))
            HStack
            {
                Text("morning")
                Text("afternoon")
                Text("evening")
            }
            
            Text("What would you like to measure?")
                .font(Constants.titleFont) // Make sure Constants.titleFont is defined
                .foregroundColor(Color("ipseBlack"))
            
            VStack(alignment: .center)
            {
                Text("tired vs energized")
                Text("tired vs energized")
                Text("tired vs energized")
                Text("tired vs energized")
                Text("tired vs energized")
            }
            
            ContinueButton(action: {
            }, width: 120, height: 40)
            Spacer()
            
            Text("these options can always be edited later via the settings menu")
                .font(Constants.subtitleFont) // Make sure Constants.titleFont is defined
                .foregroundColor(Color("ipseBlack"))
                                 
        }
        .padding(EdgeInsets(top: 0, leading: Constants.horizontalPadding, bottom: 0, trailing: Constants.horizontalPadding))

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
