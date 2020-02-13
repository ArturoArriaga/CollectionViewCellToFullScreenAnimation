//
//  HorizontalProductCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/2/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    var product: Product! {
        didSet {
            self.itemStackView.imageView.image = UIImage(named: product.imageName)
            self.itemStackView.priceLabel.text = " $\(String(product.price))"
            self.itemStackView.productName.text = product.itemName
        }
    }
    
    let itemStackView = ItemStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemStackView)
        self.clipsToBounds = true
        
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            itemStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            itemStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            itemStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
