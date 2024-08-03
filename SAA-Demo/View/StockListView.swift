//
//  StockListView.swift
//  SAA-Demo
//
//  Created by SAHIL AMRUT AGASHE on 03/08/24.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        List(stocks, id: \StockViewModel.symbol) { stock in
            StockCellView(stock: stock)
        }
        
    }

}

struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    //.foregroundStyle(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            VStack {
                Text(stock.price)
                    //.foregroundStyle(.white)
                    .font(.custom("Arial", size: 22))
                
                Button(stock.change) {
                    
                }
                .frame(width: 75)
                .padding(5)
                .background(.red)
                .foregroundStyle(.white)
                .cornerRadius(6)
            }
        }
        
        
    }
        
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "Goog", description: "Google Innovation Media", price: 1000, change: "-0.24")
        
        return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
