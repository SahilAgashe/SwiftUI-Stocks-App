//
//  StockListViewModel.swift
//  SAA-Demo
//
//  Created by SAHIL AMRUT AGASHE on 03/08/24.
//

import Foundation

class StockListViewModel: ObservableObject {
    @Published var stocks = [StockViewModel]()
    var searchTerm = ""
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { [weak self] stocks in
            if let stocks {
                DispatchQueue.main.async {
                    self?.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}
