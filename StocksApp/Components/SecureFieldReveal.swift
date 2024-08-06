//
//  SecureFieldReveal.swift
//  StocksApp
//
//  Created by The Seven Stallions on 12/07/22.
//

import SwiftUI

struct SecureFieldReveal: View {
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    @Binding var text: String

    var body: some View {
        HStack {
            ZStack(alignment: .trailing) {
                TextField("", text: $text)
                    .modifier(LoginModifier())
                    .focused($focus1)
                    .opacity(showPassword ? 1 : 0)
                SecureField("", text: $text)
                    .modifier(LoginModifier())
                    .focused($focus2)
                    .opacity(showPassword ? 0 : 1)
                Button(action: {
                    showPassword.toggle()
                    if showPassword { focus1 = true } else { focus2 = true }
                }, label: {
                    Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.showPassword ? Color("White"):Color.gray)
                        .font(.system(size: 16, weight: .regular))
                })
            }
        }
    }
}

struct LoginModifier: ViewModifier {

    var borderColor: Color = Color.gray

    func body(content: Content) -> some View {
        content
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .textContentType(.password)
    }

}

struct SecureFieldReveal_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldReveal(text: .constant(""))
    }
}
