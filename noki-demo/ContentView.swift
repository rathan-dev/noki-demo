//
//  ContentView.swift
//  noki-demo
//
//  Created by rathan on 22/07/24.
//

import SwiftUI


extension Color {
    static let customPurple = Color(red: 117/255, green: 23/255, blue: 198/255)
}


struct ContentView: View {
    @State private var username: String = ""
    @State private var password:String=""
    var body: some View {
        ZStack{
            Image("background").resizable().ignoresSafeArea()
                
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.3))
               .frame(width: 350, height: 500)

            
            VStack(alignment:.leading) {
                VStack(alignment:.leading){
                    Text("Login")
                        .font(.custom("Nunito-Regular", size: 32)).foregroundStyle(Color.white)
                    HStack{
                        Text("Don’t have an account?") .font(.custom("Nunito-Regular", size: 16)).foregroundStyle(Color.white)
                        Text("Sign Up").font(.custom("Nunito-Bold", size: 16)).foregroundStyle(Color.white).bold()
                    }
                    
                }
                VStack(alignment:.leading){
                    
                    TextField(  "User Name*",
                                text: $username).padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10).frame(width: 300,height: 54).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    SecureField(  "Password*",
                                  text: $password).padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10).frame(width: 300,height: 54).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/) .padding(.top, 20)
                    
                    Button(action:{
                        print("hello")
                    }){
                        Text("Forget Password ?").font(.custom("Nunito-Regular", size: 16))
                    }.foregroundColor(.white).padding(.horizontal,0).padding(.top,10)
                    
                    
                    
                }
                
                VStack{
                    Button(action:{
                        print("Google")
                    }){
                        Text("Login").foregroundStyle(Color.white).font(.custom(FontStyle.NokiBold, size: 20)) .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }.frame(width: 300,height:54).background(Color.customPurple).cornerRadius(10)
                }.padding(.top,20)
                
                VStack{
                    Text("Or Continue With").font(.custom(FontStyle.NokiBold, size:15)).foregroundStyle(Color.white)
                    
                    HStack(spacing:20){
                        Button(action:{
                        }) {
                            VStack{
                                Image("google") .resizable() .frame(width: 25,height: 25).padding(10)
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
                }.padding(.top,20)
                
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
