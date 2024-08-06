//
//  LoginView.swift
//  StocksApp
//
//  Created by The Seven Stallions on 08/07/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var isSignIn:Bool = true
    @ObservedObject var mainModel:MainViewModel
    @State var animate:Bool  = false
    @State var registerAnimation:Bool = false
    @State var loginAnimation:Bool = false
    
    var body: some View {
        ZStack{
            HStack {
                Spacer()
                VStack(spacing:0){
                    
                    RegisterAndLoginView(mainModel: mainModel)
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.top)

                    
                    if mainModel.touchSignIn {
                        VStack{
                            HStack {
                                Text("Let's sign you in.")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(Color("TextColor"))
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.top, 70)
                            
                            HStack{
                                
                                Text("Great to have you back!")
                                    .opacity(0.5)
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color("TextColor"))
                                    .padding(.leading)
                                    .padding(.top, 4)
            
                                Spacer()
                                
                            }
            
                            LoginForm(mainModel: mainModel)
                                .padding(.top, 30)
                            
                            Text("or Sign in with")
                                .foregroundColor(Color("TextColor"))
                                .padding(.top, 40)
                                .padding(.bottom, 40)
                            
                            Button(action: {
                                
                            }, label: {
                                
                                ZStack{

                                    Rectangle()
                                        .fill(Color("TextColor"))
                                        .frame(height: 60)
                                        .cornerRadius(15)
                                        .padding(.leading)
                                        .padding(.trailing)
                                    
                                    Text("Sign In with Google")
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("BackgroundColor"))
                                    
                                    HStack{
                                        Image("google")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .padding(.leading, 35)
                                        
                                        Spacer()
                                    }
                                    
                                }
                                

                            })
                        }
                        .offset(x: isSignIn ? 0:-370)
                        .animation(.spring())
                        
                        Spacer()
                        

                    }else{

                        ScrollView(.vertical){
                            HStack {
                                Text("Begin your Financial Journey.")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(Color("TextColor"))
                                    .padding(.leading)
                                    .padding(.top, 70)
                                Spacer()
                            }
                            
                            HStack{
                                
                                Text("A small step to a better future!")
                                    .opacity(0.5)
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color("TextColor"))
                                    .padding(.leading)
                                    .padding(.top, 4)

                                Spacer()
                                
                            }
                            
                            RegisterView(mainModel: mainModel)
                                .padding(.top, 30)
                            
                            Text("or Sign up with")
                                .foregroundColor(Color("TextColor"))
                                .padding(.top, 40)
                                .padding(.bottom, 40)
                            
                            Button(action: {
                                
                            }, label: {
                                
                                ZStack{

                                    Rectangle()
                                        .fill(Color("TextColor"))
                                        .frame(height: 60)
                                        .cornerRadius(15)
                                        .padding(.leading)
                                        .padding(.trailing)
                                    
                                    Text("Sign Up with Google")
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("BackgroundColor"))
                                    
                                    HStack{
                                        Image("google")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .padding(.leading, 35)
                                        
                                        Spacer()
                                    }
                                    
                                }
                            })
                            .padding(.bottom)

                            
                        }
                        
                        
                    }


                }
                
                Spacer()
            }
            

        }
        .offset(x: animate ? 0:370)
        .animation(.spring())
        .background(Color("BackgroundColor"))
        .navigate(to: HomeView(mainModel: mainModel), when: $mainModel.openHomeview)
        .onAppear{
            animate.toggle()
        }
    }
}

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(mainModel: MainViewModel())
            .previewDevice("iPhone 11 Pro")
    }
}
