//
//  Cart.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/11/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import Foundation

class Cart {
    private(set) var items: [CartItem] = []
}

extension Cart {
    var total: Float {
        get {
            return items.reduce(0.0) { (value, item) in
                value + item.subTotal
            }
        }
    }
    
    var totalQuantity: Int {
        get {
            return items.reduce(0) { (value, item) in
                value + item.quantity
            }
        }
    }
    
    func updateCart(with product: Product){
        if !self.contains(product: product) {
            self.add(product: product)
        } else {
            self.remove(product: product)
        }
    }
    
    func updateCart() {
        for item in self.items {
            if item.quantity == 0 {
                updateCart(with: item.product)
            }
        }
    }
    
    
    //add a product to the cart
    func add(product: Product) {
        // filter items until product matches
        let item = items.filter { $0.product == product }
        //if there already excits an item, increase the quantity
        if item.first != nil {
            item.first!.quantity += 1
        } else {
        //if not, add it to the cart
            items.append(CartItem(product: product))
        }
    }
    //remove a product from the cart
    func remove(product: Product) {
        //confirm the item is in the cart
        guard let index = items.firstIndex(where: {$0.product == product}) else { return }
        //remove it
        items.remove(at: index)
    }
    
    //check if item is in the cart
    func contains(product: Product) -> Bool{
        // filter items
        let item = items.filter { $0.product == product }
        // return true if the first item is not nil. In other words, it's in the cart.
        return item.first != nil
    }
    
    
    
    
//    func updateCart(with product: Product) {
//        if !self.contains(product: Product) {
//            add
//        }
//    }
}
