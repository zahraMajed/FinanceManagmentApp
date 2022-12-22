//
//  setUpInfo2.swift
//  FinanceManagmentApp
//
//  Created by Reema Alsheddi on 19/12/2022.
//

import SwiftUI

struct setUpInfo2: View {
    @State private var size = 1.0
    @State private var opacity = 0.5
  @AppStorage("shouldshowonboarding") var shouldshowonboarding: Bool = true
    @State private var showNextView: Bool = false
    var body: some View {
        
        ZStack(alignment: .leading){

            Rectangle()
            LinearGradient(gradient: Gradient(colors: [Color.white, Color("Purpe")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                       .ignoresSafeArea()

            VStack{
                Image("logo 1")
                    .font(.system(size: 90))
                
                ViewTitleDescription(viewTitle: "PAYWISE", viewDescription: "We will need some information to get started")
//                    .padding(.leading)
                
                HStack{
                    Text("1")
                        .foregroundColor(Color("AccentPurpleLight"))
                        .padding(9)
                      .background(.white)

                        .clipShape(Circle())
//                        .padding(.leading)
                    
                    
                    Text("Basic Information")
                    .foregroundColor(Color("grayText"))

//                        .frame(maxWidth: .infinity, alignment: .leading)
                     }
                .padding(.leading, -120)
                
//                    .frame(maxWidth: .infinity, alignment: .leading)
                
                //    Spacer()
                HStack{
                    
                    Text("2")
                        .foregroundColor(.white)

                        .padding(9)
                    .background(Color("AccentPurpleLight"))

                        .clipShape(Circle())
                        .padding(.leading)
                    
                    Text("Financial Information")
//                        .padding(.leading)
//                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                }.padding(.leading, -120)
                    Spacer()
                
                Text("Share with us a little bit of your financial    information so that we can develop an      appropriate financial strategy. All your data          will be secure. ")
                    .padding(.leading, 99)
                    .frame(height: 95)

                           Spacer()

                

                LargeButton(text: "Start", isfilled: true) {
                    showNextView = true
                }
                .padding(.leading, -10)
                Spacer(minLength: 80)
                
                NavigationLink(destination: PhoneNumberPInfo(), isActive: $showNextView) {
                }.labelsHidden()

            }
        }.fullScreenCover(isPresented: $shouldshowonboarding, content: {onboarding1(shouldshowonboarding: $shouldshowonboarding)})
        
//        VStack(alignment: .leading, spacing: 15){
//            Image("Logo")
//                .padding(.top)
//                .padding(.trailing)
//
//            ViewTitleDescription(viewTitle: "PAYWISE", viewDescription: "We will need some information to get started")
//                .padding(.leading)
//            Spacer()
//            HStack{
//            Text("1")
//                .foregroundColor(Color("AccentPurpleLight"))
//                .padding(9)
//                .background(.white)
//                .clipShape(Circle())
//                .padding(.leading)
//
//
//            Text("Basic Information")
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .foregroundColor(Color("grayText"))
//
//            .bold() }
//
//
//          .frame(height: 85)
//            HStack{
//
//                Text("2")
//                    .foregroundColor(.white)
//                    .padding(9)
//                    .background(Color("AccentPurpleLight"))
//                    .clipShape(Circle())
//                    .padding(.leading)
//
//                Text("Financial Information")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            Text("Share with us a little bit of your financial information so that we can develop an appropriate financial strategy. All your data will be secure. ")
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.leading, 40.0)
//            Spacer()
//            LargeButton(text: "Start", isfilled: true) {
//               showNextView = true
//            }
//            .padding(5)
//            .padding(.leading)
//
//            Spacer()
//
//            NavigationLink(destination: FinancialPlanInfo(), isActive: $showNextView) {
//            }.labelsHidden()
//        }
    }
}

struct setUpInfo2_Previews: PreviewProvider {
    static var previews: some View {
        setUpInfo2()
    }
}
