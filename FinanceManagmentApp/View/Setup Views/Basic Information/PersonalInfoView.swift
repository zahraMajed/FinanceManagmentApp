//
//  PersonalInfoView.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 20/05/1444 AH.
//

import SwiftUI

struct PersonalInfoView: View {
    //MARK: vars
    @EnvironmentObject var userData : User
    @State private var showNextView: Bool = false
    
    
    //MARK: body
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            ViewTitleDescription(viewTitle: "Personal Information", viewDescription: "Please fill the information ")
            Spacer()
            VStack (spacing: 17){
                CustomTextField(textFieldLabel: "Name", textFieldHint: "First & Last name", isSwitch: false, isCurrancy: false, userInput: $userData.name)
                
                CustomTextFieldWithDate(textFieldLabel: "Date of Bitrh", datePickerTitle: "Date of birth", selectedDate: $userData.dateOfBirth)
                
                CustomTextField(textFieldLabel: "National ID", textFieldHint: "1100110011", isSwitch: false, isCurrancy: false, userInput: $userData.nationalID)
            }
            Spacer()
            LargeButton(text: "Continue", isfilled: true) {
                showNextView = true
            }
            Spacer()
        NavigationLink(destination: setUpInfo2(), isActive: $showNextView) {
            }.labelsHidden()
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
            .environmentObject(User())
    }
}
