//
//  RegisterView.swift
//  StocksApp
//
//  Created by The Seven Stallions on 08/07/22.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var mainModel:MainViewModel
    
    var body: some View {
            VStack{
                RegisterForm(mainModel: mainModel)
                    .padding(.top)
            }
            .background(Color("BackgroundColor"))
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(mainModel: MainViewModel())
    }
}
