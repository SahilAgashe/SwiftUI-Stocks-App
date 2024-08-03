//
//  StockViewModel.swift
//  SAA-Demo
//
//  Created by SAHIL AMRUT AGASHE on 03/08/24.
//

import Foundation

struct StockViewModel {
    let stock: Stock
    
    var symbol: String {
        stock.symbol.uppercased()
    }
    
    var description: String {
        stock.description
    }
    
    var price: String {
        String(format: "%.2f", stock.price)
    }
    
    var change: String {
        stock.change
    }
}
