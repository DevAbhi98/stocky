//
//  RegisterForm.swift
//  StocksApp
//
//  Created by The Seven Stallions on 08/07/22.
//

import SwiftUI

struct RegisterForm: View {
    
    @ObservedObject var mainModel:MainViewModel
    @AppStorage("username") var usernameString:String = ""
    @AppStorage("email") var emailString:String = ""
    @AppStorage("password") var passwordString:String = ""
    
    @State var name:String = ""
    @State var username:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var confirmPassword:String = ""
    @State var isEmailValid:Bool = true
    @State var nameEmpty:Bool = false
    @State var usernameEmpty:Bool = false
    @State var passwordEmpty:Bool = false
    @State var confirmPasswordEmpty:Bool = false
    @State var passwordsMatch:Bool = true
    @State var registrationComplete:Bool = false

    func checkNameValidations() -> Bool{
        return nameEmpty || usernameEmpty
    }
    
    func passwordValidations() -> Bool {
        return passwordEmpty || confirmPasswordEmpty
    }
    
    func emailNameValidation() -> Bool {
        return textFieldValidatorEmail(email) || checkNameValidations()
    }
    
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
            
            VStack(spacing:0){
                HStack(spacing: 0) {

                    Image("account")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(.leading)
                        .opacity(0.5)
                    
                    TextField("", text: $name)
                        .modifier(PlaceholderStyle(showPlaceHolder: name.isEmpty,
                                                   placeholder: "Full Name"))
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 18))

                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 2)
                                .opacity(0.7)
                )
                
          
                HStack {
                    Text("Name can not be empty")
                            .font(.callout)
                            .foregroundColor(Color.red)
                            .padding(.leading)
                    Spacer()
                }.isHidden(!nameEmpty, remove: true)
            }
            
            VStack(spacing: 0){
                HStack(spacing: 0) {

                    Image("id-card")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(.leading)
                        .opacity(0.5)
                    
                    TextField("", text: $username)
                        .modifier(PlaceholderStyle(showPlaceHolder: username.isEmpty,
                                                   placeholder: "Username"))
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 18))

                }
                .overlay(
                    
                    RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 2)
                                .opacity(0.7)
                )
                .padding(.top, 10)
                

                HStack {
                    Text("Username can not be empty")
                            .font(.callout)
                            .foregroundColor(Color.red)
                            .padding(.leading)
                    Spacer()
                }.isHidden(!usernameEmpty, remove: true)
            }

            VStack(spacing:0){
             
                HStack(spacing: 0) {

                    Image("email")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 28)
                        .padding(.leading)
                        .opacity(0.5)
                    
                    TextField("", text: $email)
                        .modifier(PlaceholderStyle(showPlaceHolder: email.isEmpty, placeholder: "Email Address"))
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 18))

                }
                .overlay(
                    
                    RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 2)
                                .opacity(0.7)
                )
                .padding(.top, 10)

                HStack {
                    Text("Email is Not Valid")
                            .font(.callout)
                            .foregroundColor(Color.red)
                            .padding(.leading)
                    Spacer()
                }.isHidden(isEmailValid , remove: true)
                
            }
            
            VStack(spacing:0){
             
                HStack(spacing: 0) {
                    
                    Image("lock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
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
            

                HStack {
                    Text("Password can not be empty")
                            .font(.callout)
                            .foregroundColor(Color.red)
                            .padding(.leading)
                    Spacer()
                }.isHidden(!passwordEmpty, remove: true)
                
            }
            
            VStack(spacing: 0){

                HStack(spacing: 0) {

                    Image("lock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(.leading)
                        .opacity(0.5)
                    
                    SecureFieldReveal(text: $confirmPassword)
                        .modifier(PlaceholderStyle(showPlaceHolder: confirmPassword.isEmpty,
                                                   placeholder: "Confirm password"))
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 18))

                }
                .overlay(
                    
                    RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 2)
                                .opacity(0.7)
                )
                .padding(.top, 10)
                
                HStack {
                    Text("Password can not be empty")
                            .font(.callout)
                            .foregroundColor(Color.red)
                            .padding(.leading)
                    Spacer()
                }.isHidden(!confirmPasswordEmpty, remove: true)
                
                HStack {
                    Text("Confirm password does not match")
                            .font(.callout)
                            .foregroundColor(Color.red)
                            .padding(.leading)
                    Spacer()
                }.isHidden(passwordsMatch, remove: true)
                
            }
  
            Button(action: {
                
                
                
                if (name.isEmpty || username.isEmpty) {
                    
                    if(name.isEmpty){
                        nameEmpty = true
                    }

                    if(username.isEmpty){
                        usernameEmpty = true
                    }

                    if(textFieldValidatorEmail(email) || password.isEmpty){

                        if(!textFieldValidatorEmail(email)){
                                isEmailValid = false
                        }

                        if(password.isEmpty){
                            passwordEmpty = true
                        }

                        if(confirmPassword.isEmpty){
                            confirmPasswordEmpty = true
                        }

                    }

                }else{
                    if(password == confirmPassword){
                        usernameString = username
                        emailString = email
                        passwordString = password
                        isEmailValid = true
                        nameEmpty = false
                        usernameEmpty = false
                        passwordEmpty = false
                        confirmPasswordEmpty = false
                        passwordsMatch = true
                        registrationComplete = true
                    }else{
                        passwordsMatch = false
                    }
                }
                
            }, label: {
                
                ZStack{

                    Rectangle()
                        .fill(Color("TextColor"))
                        .frame(height: 60)
                        .cornerRadius(15)
                    
                    Text("Sign Up")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("BackgroundColor"))
                    
                }
                

            })
            .padding(.top)
            .alert(isPresented: $registrationComplete) { () -> Alert in
                            Alert(title: Text("Registration Complete!"), message: Text("Your account has been registered, you can login by entering your credentials."), dismissButton: .default(Text("Dismiss"), action: {
                                mainModel.touchSignIn = true
                                print("Okay Click")
                            }))
            }
               
        }.background(Color("BackgroundColor"))
            .padding(.leading)
            .padding(.trailing)
    }
}

extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

struct RegisterFormPreview: PreviewProvider {
    static var previews: some View {
        RegisterForm(mainModel: MainViewModel())
            .previewDevice("iPhone 11 Pro")
    }
}
