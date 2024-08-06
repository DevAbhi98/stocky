//
//  File.swift
//  StocksApp
//
//  Created by The Seven Stallions on 07/07/22.
//

import Foundation

struct Stock:Decodable{
    var symbol:String
    var description:String
    var price:Double
    var change:String
}
