//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name : String { get }
    func price() -> Int
}

class Item : SKU {
    let name : String
    let unitPrice : Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.unitPrice = priceEach
    }
    
    func price() -> Int {
        return unitPrice
    }
}

class Receipt {
    private var skus : [SKU] = []
    
    func items() -> [SKU] {
        return skus
    }
    
    func add(_ sku : SKU) {
        skus.append(sku)
    }
    
    func total() -> Int{
        return skus.reduce(0) {$0 + $1.price()}
    }
    
    func output() -> String {
        var result = "Receipt:\n"
        for sku in skus {
            let amount = Double(sku.price()) / 100.0
            result += "\(sku.name): $\(String(format: "%.2f", amount))\n"
        }
        result += "------------------\n"
        result += "TOTAL: $\(String(format: "%.2f", Double(total()) / 100.0))"
        return result
    }
}

class Register {
    private var receipt: Receipt
    
    init() {
        receipt = Receipt()
    }
    
    func scan(_ sku : SKU) {
        receipt.add(sku)
    }
    
    func subtotal() -> Int {
        return receipt.total()
    }
    
    func total() -> Receipt {
        let finished = receipt
        receipt = Receipt()
        return finished
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

