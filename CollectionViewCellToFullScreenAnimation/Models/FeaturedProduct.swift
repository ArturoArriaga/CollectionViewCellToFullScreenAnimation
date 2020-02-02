//
//  FeaturedProduct.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/1/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

struct FeaturedItem {
    let image: String
    let title: String
    let subtitle: String?
}




//
struct FeaturedItems {
    static let productStream: [FeaturedItem] = [
        FeaturedItem(image: "", title: "", subtitle: ""),
        
        FeaturedItem(image: "veggies", title: "The freshest produce", subtitle: "Come see what's in season"),
        FeaturedItem(image: "", title: "", subtitle: ""),
        
        FeaturedItem(image: "salmon", title: "Japanese-style Tilapia", subtitle: "with Garlic Rice and Ponzo Mayo")
    ]
}
