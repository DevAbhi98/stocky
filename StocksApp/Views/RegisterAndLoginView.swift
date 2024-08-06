//
//  RegisterAndLoginView.swift
//  StocksApp
//
//  Created by The Seven Stallions on 08/07/22.
//

import SwiftUI

struct RegisterAndLoginView: View {
    
    @ObservedObject var mainModel:MainViewModel
    @State var size:CGSize = .zero
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(Color("ToggleColor"))
                .frame(width: 340, height: 60)
                .cornerRadius(20)

            Rectangle()
                .fill(Color("TextColor"))
                .frame(width: 170, height: 60)
                .cornerRadius(20)
                .offset(x: mainModel.touchSignIn ? 86:-86)
//
            
            HStack{
                HStack{
                    Text("Register")
                        .foregroundColor(mainModel.touchSignIn ? Color("White"):Color("Black"))
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                }
                .frame(width: 170, height: 60)
                .contentShape(Rectangle())
                .onTapGesture {
                    mainModel.touchSignIn = false
                }
                .cornerRadius(20)
                
                HStack{
                    Text("Sign In")
                        .foregroundColor(mainModel.touchSignIn ? Color("Black"):Color("White"))
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                }
                .frame(width: 170, height: 60)
                .contentShape(Rectangle())
                .onTapGesture {
                    mainModel.touchSignIn = true
                }
                .cornerRadius(20)
                
            }
       
        }
    }
}

struct RegisterAndLoginView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAndLoginView(mainModel: MainViewModel())
            .previewLayout(.sizeThatFits)
    }
}
