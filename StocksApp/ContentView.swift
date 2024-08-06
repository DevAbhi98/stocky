//
//  ContentView.swift
//  StocksApp
//
//  Created by The Seven Stallions on 07/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var mainModel:MainViewModel = MainViewModel()
    
    var body: some View {
        ZStack{
            if mainModel.isOnBoardingViewActive{
                OnBoarding(mainModel: mainModel)
            }else{
                LoginView(mainModel: mainModel)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11 Pro")
    }
}
