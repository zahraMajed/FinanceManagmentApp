//
//  SplashView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct SplashView: View {
    //MARK: vars
    @State private var isSplashActive = true
    @EnvironmentObject var userData : User
    @State private var size = 1.0
    @State private var opacity = 0.5
   
    var body: some View {
        if isSplashActive {
            //animation splash screen
            //make sure isSplashActive is false
            ZStack{

                Rectangle()
                LinearGradient(gradient: Gradient(colors: [Color.white, Color("Purpe")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                           .ignoresSafeArea()

            VStack {
                Image("logo 1")
                    .font(.system(size: 90))
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 3.0)) {
                    self.size = 0.8
                    self.opacity = 1.00
                }
            }
        }
        .onAppear {
DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                               withAnimation {
                                   self.isSplashActive = false
                               }
                           }
                       }

            
            
        } else {
            /*if userData.isSetupDone {
                NavigationView {
                    Login()
                        //.environmentObject(userData)
                }
            } else {
                /// How to end navigation view? (i need the navigation view only for 2 views then i need view with full screen then after that i need navigation view again
                NavigationView {
                    SetupInfoView()
                }
            }*/
            NavigationView {
                SetupInfoView()
            }
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(User())
    }
}

