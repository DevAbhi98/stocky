//
//  RegisterView.swift
//  StocksApp
//
//  Created by The Seven Stallions on 08/07/22.
//

import SwiftUI

struct LoginForm: View {
    
    @ObservedObject var mainModel:MainViewModel
    
    var body: some View {
        VStack{

            LoginDetailsForm(mainModel:mainModel)
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)

        }
        .background(Color("BackgroundColor"))
    }
}

struct LoginPreviewForm: PreviewProvider {
    static var previews: some View {
        LoginForm(mainModel: MainViewModel())
    }
}
