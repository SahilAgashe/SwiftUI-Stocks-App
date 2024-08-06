//
//  ContentView.swift
//  SAA-Demo
//
//  Created by SAHIL AMRUT AGASHE on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        //UITableView.appearance().backgroundColor = .black
        //UITableViewCell.appearance().backgroundColor = .black
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
        }.onWillAppear {
            stockListVM.load()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView().previewDevice("iPhone 15 Pro Max")

        ContentView()
    }
}

extension View {
    func onWillAppear(_ perform: @escaping () -> Void) -> some View {
        modifier(WillAppearModifier(callback: perform))
    }
}

struct WillAppearModifier: ViewModifier {
    let callback: () -> Void

    func body(content: Content) -> some View {
        content.background(UIViewLifeCycleHandler(onWillAppear: callback))
    }
}

struct UIViewLifeCycleHandler: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    var onWillAppear: () -> Void = { }

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> UIViewControllerType {
        context.coordinator
    }

    func updateUIViewController(
        _: UIViewControllerType,
        context _: UIViewControllerRepresentableContext<Self>
    ) { }

    func makeCoordinator() -> Self.Coordinator {
        Coordinator(onWillAppear: onWillAppear)
    }

    class Coordinator: UIViewControllerType {
        let onWillAppear: () -> Void

        init(onWillAppear: @escaping () -> Void) {
            self.onWillAppear = onWillAppear
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder _: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            onWillAppear()
        }
    }
}
