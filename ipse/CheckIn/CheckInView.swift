

import SwiftUI

struct CheckInView: View {
    @ObservedObject
    var viewModel = CheckInViewModel()
    
    @EnvironmentObject
    var appState: AppState
    
    
    var body: some View {
        ZStack {
            if viewModel.currentStep == 1 {
                checkInStep1
                    .transition( .opacity)
            } else if viewModel.currentStep == 2 {
                checkInStep2
                    .transition( .opacity)
            }
            else if viewModel.currentStep == 3
            {
                checkInStep3
                    .transition( .opacity)
            }
        }
        .animation(.default, value: viewModel.currentStep)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .edgesIgnoringSafeArea(.all)
    }
    
    private var checkInStep1: some View {
        
        VStack
        {
            if appState.hasPendingCheckIn()
            {
                let currentPartOfDay = appState.getCurrentPartOfDay()
                VStack(spacing: 30)
                {
                    Image(systemName: currentPartOfDay.iconName)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                        .font(Font.system(size: 40))
                        .background(Color("ipseBlack"))
                        .foregroundColor(Color("ipseWhite"))
                        .frame(width: 80, height: 80)
                        .cornerRadius(40)
                    
                    TextLabelButton(action: {
                        withAnimation {
                            viewModel.goToNextStep()
                        }
                    }, title: "Complete \(currentPartOfDay.title) check in")
                    .frame(width: 300, height: Constants.buttonHeight)
                }
            }
            else
            {
                VStack
                {
                    Text("Next Check In is in : ")
                    Text("Current Goal")
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: Constants.horizontalPadding, bottom: 0, trailing: Constants.horizontalPadding))
      
    }
    
    private var checkInStep2: some View {
        VStack
        {
            ScrollView(.vertical)
            {
                VStack(spacing: 15)
                {
                    ForEach(viewModel.selectedTraits)
                    {
                        trait in
                        VStack(spacing: 10)
                        {
                            TextLabelButton(action: {}, title: trait.title)
                                .frame(maxWidth: .infinity, minHeight: Constants.buttonHeight, maxHeight: Constants.buttonHeight)
                            Battery(logValue: {value in viewModel.addLoggedTraitValue(forTrait: trait, value: value)})
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: 50, leading: Constants.horizontalPadding, bottom: 50, trailing: Constants.horizontalPadding))
            }
            .frame(maxHeight: .infinity)
            TextLabelButton(action: {
                if viewModel.didLogTraits
                {
                    viewModel.goToNextStep()
                }
            }, title: "Continue")
            .frame(maxWidth: 120, minHeight: Constants.buttonHeight, maxHeight: Constants.buttonHeight)
            .opacity(viewModel.didLogTraits ? 1.0 : 0.5)
        }
        .padding(EdgeInsets(top: 80, leading: 0, bottom: 50, trailing: 0))

        .frame(maxHeight: .infinity)
    }
    
    private var checkInStep3: some View {
        VStack
        {
            Text("Nice Work! Check back in tomorrow morning!")
                .font(Constants.titleFont)
                .foregroundStyle(Color("ipseBlack"))
        }
        .frame(maxHeight: .infinity)
    }

}
