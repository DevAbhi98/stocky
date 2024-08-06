//
//  IntroScreenOne.swift
//  StocksApp
//
//  Created by The Seven Stallions on 12/07/22.
//

import SwiftUI

struct IntroScreenOne: View {
    var body: some View {
        HStack{
            Spacer()
            VStack(spacing:0){
                Spacer()
                Image("revenue-bro")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                HStack {
                    Text("Invest for the future")
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading, 25)
                    Spacer()
                }
                
                HStack {
                    Text("You'll have access to holistic wealth products, research insights that matter and a dedicated team of expert")
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

struct IntroScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreenOne()
    }
}
