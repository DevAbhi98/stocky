//
//  OnBoarding.swift
//  StocksApp
//
//  Created by The Seven Stallions on 08/07/22.
//

import SwiftUI

struct OnBoarding: View {
    
    @State var index:Int = 0
    @State var buttonAnimate:Bool = false
    @ObservedObject var mainModel:MainViewModel
    
    var body: some View {

        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
                
                TabView(selection: $index){

                    IntroItem(image: "revenue-bro", title: "Invest for the future", description: "You'll have access to holistic wealth products, research insights that matter and a dedicated team of expert.")
                        .tag(0)
                    
                    IntroItem(image: "revenue-pana", title: "Let's start your Financial Journey", description: "By Stocks without a commision and select from over 10,000 companies to invest in.")
                        .tag(1)

                    
                }//: TAB
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 450)
                
                Spacer()
                
                HStack{
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(index==0 ? Color("DotColors"): Color.gray)
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(index==1 ? Color("DotColors"):Color.gray)
                }
                .padding(.top, 30)
                .padding(.bottom, 30)
                
                if(index==1){
                    
                    Button(action: {
                        mainModel.isOnBoardingViewActive.toggle()
                    }, label: {
                        
                        ZStack{

                            Rectangle()
                                .fill(Color("TextColor"))
                                .frame(height: 60)
                                .cornerRadius(15)
                            
                            Text("Get Started")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("BackgroundColor"))
                            
                        }
            
                    })
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top)
                    .padding(.bottom)
                    .offset(y: buttonAnimate ? 0:200)
                    .animation(.spring())
                    .onAppear{
                        buttonAnimate = true
                    }
                    .onDisappear{
                        buttonAnimate = false
                    }
                }
                
            }
     
        }
        .animation(.spring())
        
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding(mainModel: MainViewModel())
    }
}
