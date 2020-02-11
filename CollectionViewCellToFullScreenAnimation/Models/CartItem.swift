//
//  CartItem.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/11/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import Foundation

class CartItem {
    var quantity: Int = 1
    var product: Product
    
    var subTotal : Float { get {
        return product.price * Float(quantity) }
    }
    
    init(product: Product) {
        self.product = product
    }
}
