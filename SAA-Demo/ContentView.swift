//
//  ContentView.swift
//  SAA-Demo
//
//  Created by SAHIL AMRUT AGASHE on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.black
                
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
                
                SearchView(searchTerm: $searchTerm)
                    .offset(y: -250)
            }
            
            .navigationBarTitle("Stocks")
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
