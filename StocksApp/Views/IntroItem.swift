//
//  IntroItem.swift
//  StocksApp
//
//  Created by The Seven Stallions on 12/07/22.
//

import SwiftUI

struct IntroItem: View {
    
    var image:String // revenue-pana
    var title:String // Let's start your Financial Journey
    var description:String // By Stocks without a commision and select from over 10,000 companies to invest in.
    
    var body: some View {
        
            VStack(spacing:0){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                HStack {
                    Text(title)
                        .foregroundColor(Color("TextColor"))
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 25)
                        .padding(.top)
                    Spacer()
                }
                
                HStack {
                    Text(description)
                        .foregroundColor(Color("TextColor"))
                        .padding(.top, 10)
                        .padding(.leading, 25)
                    Spacer()
                }

            }

        .background(Color("BackgroundColor"))
    }
}

struct IntroItem_Previews: PreviewProvider {
    static var previews: some View {
        IntroItem(image: "", title: "", description: "")
    }
}
