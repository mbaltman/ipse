import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer() // Use a Spacer to push all content to the top

            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Text("Welcome to Ipse")
                    .font(Font.custom(Constants.readexFont, size: 36).bold())
                    .foregroundColor(Color("ipseBlack"))
                Text("What gets measured, gets managed")
                    .font(Constants.bodyFont)

                    .foregroundColor(Color("ipseBlack"))
            })

            
            Text("The following questions will set up a series of daily check-ins. The goal of this tool is to build self-awareness of how you are feeling throughout the day.")
                .font(Constants.bodyFont)
                .foregroundColor(Color("ipseBlack"))
                    .padding()
                    .background(Color("ipseWhite"))
                    .cornerRadius(Constants.textFieldRounding)
                    .shadow(color: Color("ipseBlack"), radius: 0, x: 5, y: 5)
                    .padding()
            
            ContinueButton(action: {
                           // Define your continue button action here
                       })
            Spacer() // Use a Spacer to push all content to the top

        }
        .padding(EdgeInsets(top: 0, leading: Constants.horizontalPadding, bottom: 0, trailing: Constants.horizontalPadding))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background")) // Set the background color to purple
        .edgesIgnoringSafeArea(.all) // Make the background fill the entire screen, ignoring the safe area
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
