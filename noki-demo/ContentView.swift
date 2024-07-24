//
//  ContentView.swift
//  noki-demo
//
//  Created by rathan on 22/07/24.
//

import SwiftUI
import Firebase


extension Color {
    static let customPurple = Color(red: 117/255, green: 23/255, blue: 198/255)
}


struct ContentView: View {
    @State private var username: String = ""
    @State private var password:String=""
    @State private var isLoggedIn=false
    
    var body: some View {
        if(isLoggedIn){
            //GoSomewhere
            Pateints().environmentObject(Datamanager())
        }else{
            content
        }
    }
    
    var content:some View{
        NavigationView {
            ZStack{
                Image("background").resizable().ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.3))
                    .frame(width:Responsiveness.screenWidth*0.9, height:Responsiveness.screenHeight*0.66)
                
                
                VStack(alignment:.leading) {
                    VStack(alignment:.leading){
                        Text("Login")
                            .font(.custom("Nunito-Regular", size: Responsiveness.screenWidth*0.09)).foregroundStyle(Color.white)
                        HStack{
                            Text("Don’t have an account?") .font(.custom("Nunito-Regular", size: Responsiveness.screenWidth*0.04)).foregroundStyle(Color.white)
                            Text("Sign Up").font(.custom("Nunito-Bold", size: Responsiveness.screenWidth*0.04)).foregroundStyle(Color.white).underline(true, color: .white)
                        }
                        
                    }
                    VStack(alignment:.leading){
                        
                        TextField(  "User Name*",
                                    text: $username).padding()
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10).frame(width: Responsiveness.screenWidth*0.77,height:Responsiveness.screenHeight*0.06).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        SecureField(  "Password*",
                                      text: $password).padding()
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10).frame(width: Responsiveness.screenWidth*0.77,height:Responsiveness.screenHeight*0.06).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/) .padding(.top, 20)
                        
                        Button(action:{
                            register()
                        }){
                            Text("Forget Password ?").font(.custom("Nunito-Regular", size:Responsiveness.screenWidth*0.04))
                        }.foregroundColor(.white).padding(.horizontal,0).padding(.top,10)
                        
                        
                        
                    }
                    
                    VStack{
                        Button(action: {
                            login()
                        }){
                            Text("Login").foregroundStyle(Color.white).font(.custom(FontStyle.NokiBold, size: Responsiveness.screenWidth*0.05)) .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }.frame(width: Responsiveness.screenWidth*0.77,height:Responsiveness.screenHeight*0.06).background(Color.customPurple).cornerRadius(10)
                    }.padding(.top,20)
                    
                    
                    VStack(alignment:.center){
                        Text("Or Continue With").font(.custom(FontStyle.NokiBold, size:Responsiveness.screenWidth*0.04)).foregroundStyle(Color.white)
                        
                        HStack(spacing:20){
                            Button(action:{
                            }) {
                                VStack{
                                    Image("google") .resizable() .frame( width: 25,height: 25).padding(10)
                                }.cornerRadius(8)
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .inset(by: 0.5)
                                            .stroke(Color(red: 0.74, green: 0.74, blue: 0.74).opacity(0.6), lineWidth: 1)
                                        
                                    )
                            }
                            Button(action:{
                            }) {
                                VStack{
                                    Image("facebook") .resizable() .frame(width: 25,height: 25).padding(10)
                                }.cornerRadius(8)
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .inset(by: 0.5)
                                            .stroke(Color(red: 0.74, green: 0.74, blue: 0.74).opacity(0.6), lineWidth: 1)
                                        
                                    )
                            }
                            
                            Button(action:{
                            }) {
                                VStack{
                                    Image("windows") .resizable() .frame(width: 25,height: 25).padding(10)
                                }.cornerRadius(8)
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .inset(by: 0.5)
                                            .stroke(Color(red: 0.74, green: 0.74, blue: 0.74).opacity(0.6), lineWidth: 1)
                                        
                                    )
                            }
                            
                            Text("Or").font(.custom(FontStyle.NokiBold, size: 20)).foregroundStyle(Color.white)
                            
                            Button(action:{
                            }) {
                                VStack{
                                    Image("mic") .resizable() .frame(width: 25,height: 25).padding(10)
                                }.cornerRadius(8)
                                
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .inset(by: 0.5)
                                            .stroke(Color(red: 0.74, green: 0.74, blue: 0.74).opacity(0.6), lineWidth: 1)
                                        
                                    )
                                
                            }
                            
                        }.padding(.top,20)
                    }.frame(width: Responsiveness.screenWidth*0.8).padding(.top,20)
                    
                }
                .padding()
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func login() {
        Auth.auth().signIn(withEmail: username, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let user = result?.user {
                isLoggedIn = true
                user.getIDToken { idToken, error in
                    if let error = error {
                        print("Error getting ID token: \(error.localizedDescription)")
                    } else if let idToken = idToken {
                        print("ID Token: \(idToken)")
                    }
                }
            }
        }
    }

    
    func register(){
        Auth.auth().createUser(withEmail: username, password: password){result, error in
            if (error != nil){
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
