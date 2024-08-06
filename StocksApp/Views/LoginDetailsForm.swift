//
//  RegisterForm.swift
//  StocksApp
//
//  Created by The Seven Stallions on 08/07/22.
//

import SwiftUI

struct LoginDetailsForm: View {
    
    
    @AppStorage("username") var usernameString:String = ""
    @AppStorage("email") var emailString:String = ""
    @AppStorage("password") var passwordString:String = ""
    
    @State var email:String = ""
    @State var password:String = ""
    @State var rememberMeClicked:Bool = false
    @State var isEmailValid:Bool = true
    @State var passwordValid:Bool = true
    @State var invalidEmailPassword:Bool = false
    
    @ObservedObject var mainModel:MainViewModel
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    var body: some View {
        VStack{
            HStack(spacing: 0) {

                Image("account")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .padding(.leading)
                    .opacity(0.5)
            
                
                    TextField("", text: $email)
                        .modifier(PlaceholderStyle(showPlaceHolder: email.isEmpty,
                                                   placeholder: "Phone, email or username"))
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 18))

            }
            .overlay(
                
                RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 2)
                            .opacity(0.7)
            )
            
            if !self.isEmailValid {
                HStack {
                    Text("Email is Not Valid")
                            .font(.callout)
                           .foregroundColor(Color.red)
                           .padding(.leading)
                    Spacer()
                }
            }
            
            HStack(spacing:0) {
                
                Image("lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(.leading)
                    .opacity(0.5)
                
                SecureFieldReveal(text: $password)
                    .modifier(PlaceholderStyle(showPlaceHolder: password.isEmpty,
                                               placeholder: "Password"))
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 18))

            }
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 2)
                            .opacity(0.7)
            )
            .padding(.top, 10)
            
            if !self.passwordValid {
                HStack {
                    Text("Password can not be empty")
                            .font(.callout)
                           .foregroundColor(Color.red)
                           .padding(.leading)
                           .contentShape(Rectangle())
                           .onTapGesture {
                               rememberMeClicked.toggle()
                           }
                    Spacer()
                }
            }
            
            HStack{

                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(rememberMeClicked ? Color("White"):.gray, lineWidth: 2)
                        .opacity(0.7)
                        .frame(width: 18, height: 18)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            rememberMeClicked.toggle()
                        }
                    
                    Image("checks")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .opacity(rememberMeClicked ? 1:0)
                    
                }
                Text("Remember me")
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .foregroundColor(Color.gray)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        rememberMeClicked.toggle()
                    }
                
                Spacer()
                
            }
            .padding(.leading, 5)
            .padding(.top, 10)
            
            Button(action: {
                
                if (!self.textFieldValidatorEmail(self.email) || password.isEmpty) {
                    if(password.isEmpty){
                        self.passwordValid = false
                    }
                    self.isEmailValid = false
                    self.email = ""
                } else {
                    if(password.isEmpty){
                        self.passwordValid = false
                    }else{
                        self.isEmailValid = true
                        if(email == emailString || email == usernameString){
                            if(password==passwordString){
                                invalidEmailPassword = false
                                mainModel.openHomeview = true
                            }else{
                                invalidEmailPassword = true
                            }
                        }else{
                            invalidEmailPassword = true
                        }
                    }
                    
                }
                
            }, label: {
                
                ZStack{

                    Rectangle()
                        .fill(Color("TextColor"))
                        .frame(height: 60)
                        .cornerRadius(15)
                    
                    Text("Sign In")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("BackgroundColor"))
                    
                }
                

            })
            .padding(.top)
            .alert(isPresented: $invalidEmailPassword) { () -> Alert in
                            Alert(title: Text("Invalid Credentials"), message: Text("Invalid email address or password."), primaryButton: .default(Text("Okay"), action: {
                                print("Okay Click")
                            }), secondaryButton: .default(Text("Dismiss")))
            }


               
        }.background(Color("BackgroundColor"))
           
    }
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .foregroundColor(Color.gray)
                .padding(.horizontal, 10)
            }
            content
            .foregroundColor(Color("White"))
            .padding(.horizontal, 10)
        }
    }
}
struct RegisterForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginDetailsForm(mainModel: MainViewModel())
            .previewLayout(.sizeThatFits)
    }
}
