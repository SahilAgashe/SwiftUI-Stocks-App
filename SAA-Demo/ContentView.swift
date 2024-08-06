//
//  ContentView.swift
//  SAA-Demo
//
//  Created by SAHIL AMRUT AGASHE on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        //UITableView.appearance().backgroundColor = .black
        //UITableViewCell.appearance().backgroundColor = .black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = stockListVM.searchTerm.isEmpty ? 
        stockListVM.stocks : stockListVM.stocks.filter { $0.symbol.starts(with: stockListVM.searchTerm) }

        return NavigationView {
            
            ZStack(alignment: .leading) {
                Color.black
                    .ignoresSafeArea()
                
                Text("August 5 2024")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
                
                SearchView(searchTerm: $stockListVM.searchTerm)
                    .offset(y: -250)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 150)
            }
            
            .navigationBarTitle("Stocks")
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView().previewDevice("iPhone 15 Pro Max")

        ContentView()
    }
}
