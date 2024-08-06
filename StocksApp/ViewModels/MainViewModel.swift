//
//  MainViewModel.swift
//  StocksApp
//
//  Created by The Seven Stallions on 07/07/22.
//

import Foundation
import SwiftUI

class MainViewModel:ObservableObject{
    
    @Published var dragOffset:CGSize = CGSize(width: 0, height: 550)
    @Published var stocks = [StockViewModel]()
    @Published var searchTerm:String = ""
    @Published var articles = [ArticleViewModel]()
    @Published var isOnBoardingViewActive:Bool = true
    @Published var openHomeview:Bool = false
    @Published var openLoginView:Bool = false
    @Published var touchSignIn:Bool = true
    
    init(){
        fetchStocks()
        fetchArticles()
    }
    
    func fetchArticles(){
        WebService().getTopNews(completion: { articles in
            if let articles = articles{
                self.articles = articles.map(ArticleViewModel.init)
            }
        })
    }
    
    func fetchStocks(){
        WebService().getStocks{ stocks in
            if let stocks = stocks {
                self.stocks  = stocks.map(StockViewModel.init)
                print(self.stocks[0].description)
            }
        }
    }
    
    
}

class ArticleViewModel{
    
    var article:Article
    
    init(article:Article){
        self.article = article
    }
    
    var title:String{
        return self.article.title
    }
    
    var imageURL:String{
        return self.article.imageURL
    }

    var publication:String{
        return self.article.publication
    }
    
}

class StockViewModel{
    
    var stock:Stock
    
    init(stock:Stock){
        self.stock = stock
    }
    
    var symbol:String{
        return self.stock.symbol.uppercased()
    }
    
    var description:String{
        return self.stock.description
    }

    var price:String{
        return String(format: "%.2f", self.stock.price)
    }
    
    var change:String{
        return self.stock.change
    }
    
    
}
