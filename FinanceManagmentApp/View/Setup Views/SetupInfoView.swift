//
//  SetupInfoView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct SetupInfoView: View {
    @State private var size = 1.0
    @State private var opacity = 0.5
  @AppStorage("shouldshowonboarding") var shouldshowonboarding: Bool = true
    @State private var showNextView: Bool = false
    
        //@State var shouldshowonboarding: Bool = true
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
                        .foregroundColor(.white)
                        .padding(9)
                        .background(Color("AccentPurpleLight"))
                        .clipShape(Circle())
//                        .padding(.leading)
                    
                    
                    Text("Basic Information")
//                        .frame(maxWidth: .infinity, alignment: .leading)
                    .bold() }
                .padding(.leading, -120)
                
                Text("Give us your phone number and wait for the     magic! We will provide you with information,               you only have to amend it in case of error")
//                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 99)
                
                //    Spacer()
                    .frame(height: 85)
                HStack{
                    
                    Text("2")
                        .foregroundColor(Color("AccentPurpleLight"))
                        .padding(9)
                        .background(.white)
                        .clipShape(Circle())
                        .padding(.leading)
                    
                    Text("Financial Information")
//                        .padding(.leading)
//                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("grayText"))
                    
                    
                    
                }.padding(.leading, -120)
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
        
            
        }
    }
//            VStack(alignment: .leading, spacing: 15){
//
//                Image("background1")
//                    .padding(.top)
//                    .padding(.trailing)
//
//
//                ViewTitleDescription(viewTitle: "PAYWISE", viewDescription: "We will need some information to get started")
//                    .padding(.leading)
//
//                HStack{
//                    Text("1")
//                        .foregroundColor(.white)
//                        .padding(9)
//                        .background(Color("AccentPurpleLight"))
//                        .clipShape(Circle())
//                        .padding(.leading)
//
//
//                    Text("Basic Information")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    .bold() }
//
//                Text("Give us your phone number and wait for the magic! We will provide you with information, and you only have to amend it in case of error")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 40.0)
//
//                //    Spacer()
//                    .frame(height: 85)
//                HStack{
//
//                    Text("2")
//                        .foregroundColor(Color("AccentPurpleLight"))
//
//                        .padding(9)
//                        .background(.white)
//                        .clipShape(Circle())
//                        .padding(.leading)
//
//                    Text("Financial Information")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(Color("grayText"))
//
//
//
//                }
//                LargeButton(text: "Start", isfilled: true) {
//                    showNextView = true
//                }
//                .padding(.leading)
//                Spacer()
//                NavigationLink(destination: PhoneNumberPInfo(), isActive: $showNextView) {
//                }.labelsHidden()
//            }.fullScreenCover(isPresented: $shouldshowonboarding, content: {onboarding1(shouldshowonboarding: $shouldshowonboarding)})
        
  
struct SetupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SetupInfoView()
    }
}





struct onboarding1: View {
    @Binding var shouldshowonboarding: Bool
    var body: some View {
        TabView{
            PageView(title: "Easy way to manage your money", subtitle: "", imageName: "background1", showbutton: false, shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: true)
            
            PageView(title: "Set your goal " ,
                     subtitle: "Set your goal to grow your money and achieve the goal you are aiming for " ,
                     imageName: "background",
                     showbutton: false,
                     shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: false)

            
            PageView(title: "Track your goal " ,
                     subtitle: "Manage and track your goal depending on period of time and amount of money. " ,
                     imageName: "track",
                     showbutton: true,
                     shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: false)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .ignoresSafeArea()
    }
}



struct PageView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let showbutton: Bool
    @Binding var shouldshowonboarding: Bool
    let dissbutton: Bool
    var body: some View {
        ZStack{
            
            Image(imageName)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                
                
                Spacer(minLength:500)
                
                
                Text(title)
                    .frame(width: 350, height: 90, alignment: .leading)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("AccentPurpleLight"))
                
            
                Text(subtitle)
                    .frame(width: 350, height: 90, alignment: .leading)
                    .foregroundColor(Color("AccentPurpleLight"))
                
                
                
                Spacer()
                if showbutton{
                    Button {
                        shouldshowonboarding.toggle()
                    }label: {
                        
                        Text("Get Started")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 355, height: 43)
                            .background(Color("AccentGreenLight"))
                            .cornerRadius(14)
                    }
                }
                
                
                    if dissbutton{
                        Button {
                            shouldshowonboarding.toggle()
                        }label: {
                            
                            Text("Not Now")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("AccentGreenLight"))
                                .frame(width: 355, height: 43)
//                                .background(Color("greenn"))
                                .cornerRadius(14)
                        }
                }
                
                
                Spacer(minLength: 42)
                
            }
        }
        
        
    }
        
        
    }
