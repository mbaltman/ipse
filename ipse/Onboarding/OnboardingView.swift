import SwiftUI

struct OnboardingView: View {
    @ObservedObject
    var viewModel = OnboardingViewModel()
    
    @EnvironmentObject
    var appState: AppState
    
    var body: some View {
        ZStack {
            if viewModel.currentStep == 1 {
                onboardingStep1
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            } else if viewModel.currentStep == 2 {
                onboardingStep2
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
            TextLabelButton(action: {
                withAnimation {
                    self.viewModel.goToNextStep()
                }
            }, width: 120, height: 50, title: "Continue")
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: Constants.horizontalPadding, bottom: 0, trailing: Constants.horizontalPadding))

    }

    private var onboardingStep2: some View {
        VStack(alignment: .center, spacing: 40)
        {
            Spacer()
            VStack
            {
                Text("When would you like to check in?")
                    .font(Constants.titleFont)
                    .foregroundColor(Color("ipseBlack"))
                HStack(spacing: 30)
                {
                    ForEach(PartOfDay.allTimes)
                    {
                        partOfDay in
                        CircleImageButton(action: {
                            
                            if viewModel.selectedTimes.contains(partOfDay)
                            {
                                withAnimation {
                                    
                                    viewModel.selectedTimes.removeAll(where: {$0 == partOfDay})
                                }
                            }
                            else
                            {      
                                withAnimation {
                                    viewModel.selectedTimes.append(partOfDay)
                                }
                            }
                        }
                        , title: partOfDay.title, iconImage: partOfDay.iconName)
                        .opacity(viewModel.selectedTimes.contains(partOfDay) ? 1.0 : 0.5)
                    }
                }
            }
            
            VStack
            {
                Text("What would you like to measure?")
                    .font(Constants.titleFont)
                    .foregroundColor(Color("ipseBlack"))
                
                VStack(alignment: .center, spacing: 15)
                {
                    ForEach(Trait.allTraits)
                    {
                        trait in
                        TextLabelButton(action: {
                            
                            if viewModel.selectedTraits.contains(trait)
                            {
                                withAnimation {
                                    
                                    viewModel.selectedTraits.removeAll(where: {$0 == trait})
                                }
                            }
                            else
                            {
                                withAnimation {
                                    viewModel.selectedTraits.append(trait)
                                }
                            }
                            
                        }, width: 300, height: 30, title: trait.title)
                        .opacity(viewModel.selectedTraits.contains(trait) ? 1.0 : 0.5)
                    }
                }
            }
          
            let canContinue = !viewModel.selectedTimes.isEmpty && !viewModel.selectedTraits.isEmpty
            TextLabelButton(action: {
                if canContinue
                {
                    viewModel.completeOnboarding()
                    appState.checkIsOnboarded()
                }
            }, width: 120, height: 50, title: "Continue")
            .opacity(canContinue ? 1.0 : 0.5)
            
            Text("these options can always be edited later via the settings menu")
                .font(Constants.subtitleFont)
                .foregroundColor(Color("ipseBlack"))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, getSafeAreaInsets().bottom)
                            
        }
        .padding(EdgeInsets(top: 0, leading: Constants.horizontalPadding, bottom: 0, trailing: Constants.horizontalPadding))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

func getSafeAreaInsets() -> UIEdgeInsets {
    return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
}
