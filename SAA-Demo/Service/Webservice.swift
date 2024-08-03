//
//  Webservice.swift
//  SAA-Demo
//
//  Created by SAHIL AMRUT AGASHE on 03/08/24.
//

import Foundation

class Webservice {
    
    func getStocks(completion: @escaping([Stock]?) -> Void) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        
        let urlSessionDataTask = URLSession.shared.dataTask(with: url) {data , response , error in
            guard let data , error == nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
        }
        
        urlSessionDataTask.resume()
    }
}
