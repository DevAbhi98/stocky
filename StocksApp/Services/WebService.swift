//
//  WebService.swift
//  StocksApp
//
//  Created by The Seven Stallions on 07/07/22.
//

import Foundation

class WebService{
    
    func getStocks(completion: @escaping ([Stock]?) -> ()){
        
        guard let url = URL(string: "https://massive-melon-microraptor.glitch.me/stocks") else{
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                stocks == nil ? completion(nil):completion(stocks)
            }
        }.resume()
        
    }
    
    
    func getTopNews(completion: @escaping ([Article]?) -> ()){
        guard let url = URL(string: "https://massive-melon-microraptor.glitch.me/top-news") else{
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                articles == nil ? completion(nil):completion(articles)
            }
        }.resume()
        
    }
    
}
