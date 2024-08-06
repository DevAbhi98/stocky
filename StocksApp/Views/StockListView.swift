//
//  StockListView.swift
//  StocksApp
//
//  Created by The Seven Stallions on 07/07/22.
//

import SwiftUI

struct StockListView: View {
    
    let stocks:[StockViewModel]
    
    var body: some View {
        List(self.stocks, id:\.symbol){ stock in
            StockCell(stock:stock)
                .listRowBackground(Color("Black"))
        }
    }
}

struct StockCell:View{
    let stock:StockViewModel
    
    func greenOrBlue(change:String) -> Bool{
        if(change.contains("+")){
            return true
        }else{
            return false
        }
    }
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(stock.symbol)
                    .foregroundColor(Color("White"))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text(stock.description)
                    .foregroundColor(Color.gray)
                    .fontWeight(.semibold)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 0){
                Text("$\(stock.price)")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color("White"))
                ZStack{
                    Rectangle()
                        .fill(greenOrBlue(change: stock.change) ? Color.green:Color.red)
                    Text("\(stock.change)%")
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(2)
                }.frame(width: 90)
                    .cornerRadius(5)
            }
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView(stocks: [StockViewModel(stock: Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23"))])
    }
}
