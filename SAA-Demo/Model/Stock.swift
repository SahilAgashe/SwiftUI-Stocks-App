//
//  Stock.swift
//  SAA-Demo
//
//  Created by SAHIL AMRUT AGASHE on 03/08/24.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
