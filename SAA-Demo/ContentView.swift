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
        
        NavigationView {
            
            ZStack(alignment: .leading) {
                Color.black
                    .ignoresSafeArea()
                
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
                
                SearchView(searchTerm: $stockListVM.searchTerm)
                    .offset(y: -250)
                
                StockListView(stocks: stockListVM.stocks)
                    .offset(y: 150)
            }
            
            .navigationBarTitle("Stocks")
        }
        
    }
}

//#Preview {
//    ContentView()
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView().previewDevice("iPhone 15 Pro Max")

        ContentView()
    }
}
