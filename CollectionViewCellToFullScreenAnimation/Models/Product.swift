//
//  Product.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/2/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import Foundation

struct Product: Equatable {
    let itemName, imageName: String
    var price: Float
}

extension Product {
    //MARK: Equatable:
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.itemName == rhs.itemName
            && lhs.price == rhs.price
    }
}
