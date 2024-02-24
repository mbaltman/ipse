

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
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            } else if viewModel.currentStep == 2 {
                checkInStep2
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
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
                    }, width: 300, height: 50, title: "Complete \(currentPartOfDay.title) check in")
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
            
            Text("Start Checkin ")
        }
        .padding(EdgeInsets(top: 0, leading: Constants.horizontalPadding, bottom: 0, trailing: Constants.horizontalPadding))
    }
}
