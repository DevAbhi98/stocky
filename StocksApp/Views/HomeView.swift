//
//  HomeView.swift
//  StocksApp
//
//  Created by The Seven Stallions on 12/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var mainModel:MainViewModel
    @State var searchTerm:String = ""
    @State var articleView:Bool = true
    
    init(mainModel:MainViewModel){
        self.mainModel = mainModel
        
    }
    
    func logout(){
        mainModel.openLoginView = true
        mainModel.openHomeview 	= false
    }
    
    var body: some View {
        
        let filteredStocks = self.mainModel.searchTerm.isEmpty ? self.mainModel.stocks : self.mainModel.stocks.filter{
            $0.symbol.starts(with: self.mainModel.searchTerm)
        }
        
        return ZStack(alignment:.leading){
                Color("Black")
            VStack(spacing: 0){
                    
                    HStack{
                        Text("Stocks")
                            .font(.system(size: 40, weight: .bold, design: .default))
                            .padding(.leading, 20)
                            .padding(.bottom, 5)
                            .padding(.top)
                        Spacer()
                        
                        Button(action: {
                            logout()
                        }, label: {
                            Image("logout")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                                .padding(.bottom, 5)
                                .padding(.top, 15)
                        })
                        

                    }

                    
                    HStack {
                        Text("January 6, 2020")
                            .font(.custom("Arial", size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                    
                    }
                    
                    SearchView(searchTerm: $mainModel.searchTerm)
                    StockListView(stocks: filteredStocks)
                    Spacer()
                }

                NewArticleView(articles: mainModel.articles, onDragBegin: { value in
                    mainModel.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height < .zero{
                        self.mainModel.dragOffset = CGSize(width: 0, height: 100)
                    }else {
                        mainModel.dragOffset = CGSize(width: 0, height: 550)
                    }
                })
                .animation(.spring())
                .offset(y:mainModel.dragOffset.height)
                
            }
        .navigate(to: LoginView(mainModel: mainModel), when: $mainModel.openLoginView)


        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(mainModel: MainViewModel())
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
