//
//  File.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/2/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class ProductStreamController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let footerId = "footId"
    
    var adImage = #imageLiteral(resourceName: "yourAd")
    
    var products: [Product] = [
        Product(itemName: "Gala Apples", imageName: "apple", price: 2.39),
        Product(itemName: "Asaparagus", imageName: "asparagus", price: 2.39),
        Product(itemName: "Avocados", imageName: "avocados", price: 1.50),
        Product(itemName: "Bell Peppers", imageName: "bellPepper", price: 2.99),
        Product(itemName: "Roses", imageName: "roses", price: 12.99),
        Product(itemName: "Deli Meat", imageName: "deliMeat", price: 4.29),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9289988279, green: 0.9077536464, blue: 0.8706553578, alpha: 1)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AdvertisementCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCell
        cell.product = self.products[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! AdvertisementCell
        footer.imageView.image = self.adImage
        footer.backgroundColor = .purple
        
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: 275, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 120, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .normal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
