//
//  IntroScreenTwo.swift
//  StocksApp
//
//  Created by The Seven Stallions on 12/07/22.
//

import SwiftUI

struct IntroScreenTwo: View {
    
    @Binding var currentIndex:Int
    
    var body: some View {
        HStack{
            Spacer()
            VStack(spacing:0){
                Spacer()
                Image("revenue-pana")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                HStack {
                    Text("Let's start your Financial Journey")
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading, 25)
                    Spacer()
                }
                
                HStack {
                    Text("By Stocks without a commision and select from over 10,000 companies to invest in.")
                        .foregroundColor(Color.white)
                        .padding(.top, 10)
                        .padding(.leading, 25)
                    Spacer()
                }
                
                Spacer()
            }
            Spacer()
        }
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
    }
}

struct IntroScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreenTwo(currentIndex: .constant(0))
    }
}
