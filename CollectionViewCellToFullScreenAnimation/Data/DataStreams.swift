//
//  DataStreams.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/3/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

struct FeaturedItems {
    static let productStream: [FeaturedItem] = [
        FeaturedItem(image: "", title: "", subtitle: "", color: nil, labelTitle: nil),
        FeaturedItem(image: "veggies", title: "The freshest produce", subtitle: "Come see what's in season", color: #colorLiteral(red: 0.339337945, green: 0.950001657, blue: 0.1244122311, alpha: 1), labelTitle: "Texas Made"),
        FeaturedItem(image: "", title: "", subtitle: "", color: nil, labelTitle: nil),
        FeaturedItem(image: "salmon", title: "Japanese-style Tilapia", subtitle: "with Garlic Rice and Ponzo Mayo", color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), labelTitle: "Featured Dinner")
    ]
}

struct AdStream {
    static let ads: [UIImage] = [#imageLiteral(resourceName: "yourAd"),#imageLiteral(resourceName: "yourAd"),#imageLiteral(resourceName: "ad.coke"),#imageLiteral(resourceName: "ad.coke"),#imageLiteral(resourceName: "ad.disney"),#imageLiteral(resourceName: "ad.disney")]
}

struct ProductSteamTitles {
    static let titles = ["Shop todays biggest deals","", "Ready for the big game","", "Brands You Trust"]
}

struct ProductStreams {
    static var stream : [[Product]] = [
        [Product(itemName: "Cheerios", imageName: "deals.cherrios", price: 3.39),
         Product(itemName: "Folger's Classic Roast", imageName: "deals.coffee", price: 6.39),
         Product(itemName: "Texas-Farms Milk", imageName: "deals.milk", price: 1.50),
         Product(itemName: "Glade 40hr Candle", imageName: "deals.candle", price: 7.99),
         Product(itemName: "Roses", imageName: "roses", price: 12.99),
         Product(itemName: "Deli Meat", imageName: "sports.deliMeat", price: 4.29)],
        
        [Product(itemName: "", imageName: "", price: 0)],
        
        [Product(itemName: "Modelo Especial", imageName: "sports.modelo", price: 12.99),
         Product(itemName: "Chips", imageName: "sports.chips", price: 7.99),
         Product(itemName: "Ground Beef 1lb.", imageName: "sports.groundbeef", price: 3.50),
         Product(itemName: "Fritos", imageName: "sports.fritos", price: 2.99),
         Product(itemName: "Buns", imageName: "sports.buns", price: 4.99),
         Product(itemName: "Mustard", imageName: "sports.mustard", price: 5.29)],
        
        [Product(itemName: "", imageName: "", price: 0)],
        
        [Product(itemName: "Dawn Soap", imageName: "brands.dawn", price: 2.99),
         Product(itemName: "Glad Garbage Bags", imageName: "brands.gladbags", price: 5.99),
         Product(itemName: "Lysol Disinfectant.", imageName: "brands.lysol", price: 5.50),
         Product(itemName: "Mucinex", imageName: "brands.mucinex", price: 9.99),
         Product(itemName: "Brawn Paper Towels", imageName: "brands.papertowels", price: 4.99),
         Product(itemName: "Mustard", imageName: "sports.mustard", price:5.29)],
    ]
}

struct FruitsAndVeggies {
    static let fruitsAndVeggies: [[Product]] = [
        [Product(itemName: "Gala Apples", imageName: "fruit.apple", price: 2.39),
         Product(itemName: "Asaparagus", imageName: "veggie.asparagus", price: 2.39),
         Product(itemName: "Avocados", imageName: "veggie.avocados", price: 1.50),
         Product(itemName: "Bell Peppers", imageName: "veggie.bellPepper", price:2.99),
         Product(itemName: "Roses", imageName: "roses", price:12.99),
         Product(itemName: "Deli Meat", imageName: "sports.deliMeat", price:4.29)]
    ]
}
