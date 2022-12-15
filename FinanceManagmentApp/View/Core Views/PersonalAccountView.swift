//
//  PersonalAccountView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 21/05/1444 AH.
//

import SwiftUI




var cards: [Card] = [
    Card( cardType: "Personal", cardNumber: "1253  9758  7568  4049", cardImage: "Card1", cardCVV: " 123", expireDate: "Expires 01/25", cardColor: "personal"),
    Card(  cardType: "Liabilities", cardNumber: "1253  9758  7568  4049", cardImage: "Card2", cardCVV: " 123", expireDate: "Expires 01/25", cardColor: "liabilities"),
    Card(cardType: "Business", cardNumber: "1253  9758  7568  4049", cardImage: "Card3", cardCVV: " 123", expireDate: "Expires 01/25", cardColor: "business")
]



struct cardDesign : View {
    var isEyeClicked: (() -> Void)
    var isEyeHiddin : Bool = true
    
    var body: some View {
        VStack(spacing: 30) {
                HStack {
                    Text("Personal Card")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        Spacer()
                    if !isEyeHiddin {
                        Button(action: isEyeClicked) {
                            Image(systemName: "eye")
                        }
                        .foregroundColor(.white)
                        
                    }
                }
                .padding(15)
                Text("1111 2222 3333 4444")
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding(15)
                HStack{
                    Text("Exp: 10/12")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        
                    Spacer()
                    Text("CVV: 333")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        
                }.padding(15)
            }
            .frame(width: 358, height: 224)
            .background(Color("Gray1"))
            .cornerRadius(12)
            
       
    }
}

struct PersonalAccountView: View {
    //MARK: vars
    @EnvironmentObject var userData : User
    @State var selectedOption = AccountServicesSegmentedPicker.accountServicesOptions.transactions
    //MARK: body
    var body: some View {
        ScrollView(.vertical) {
            cardDesign {
                
            }
            AccountServicesSegmentedPicker(currentAccountType: .Personal, selectedOption: $selectedOption)
            TransactionsView()
        }.onChange(of: selectedOption) { newOption in
            print(newOption)
            print(selectedOption)
            /*switch newOption {
            case .transactions:
                //getTransactions()
            case .manage:
                //showManage()
            case .detailes:
                //showDetailes()
            case .goals:
                //showGoals()
            case .liabilities:
                //showliabilities()
            }*/
        }
    }
}

struct AccountServicesSegmentedPicker: View {
    //MARK: vars
    var currentAccountType : accountType
    @Binding var selectedOption : accountServicesOptions
    
    //MARK: enum
    enum accountType : String {
        case Personal
        case Business
        case Liabilities
    }
    enum accountServicesOptions : String , CaseIterable, Identifiable {
        case transactions = "Transactions"
        case manage = "Manage"
        case detailes = "Detailes"
        case goals = "Goals"
        case liabilities = "Liabilities"
        
        var id: accountServicesOptions { self }
    }
    
    //MARK: body
    var body: some View {
                
         Picker("Account Services", selection: $selectedOption) {
             ForEach(accountServicesOptions.allCases) { option in
                 
                 if option.rawValue != "Goals" && option.rawValue !=  "Liabilities" {
                     Text(option.rawValue)
                 }
                 
                 if currentAccountType == .Business && option.rawValue == "Goals" {
                     Text(option.rawValue)
                 } else if currentAccountType == .Liabilities && option.rawValue == "Liabilities" {
                     Text(option.rawValue)
                 }
             }
         }
         .frame(maxWidth: 358)
         .pickerStyle(SegmentedPickerStyle())
    }
    
}

struct PersonalAccountView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView()
    }
}
