//
//  BaseCategoryCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/29/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit
import Gifu

class FeaturedProductCell: UICollectionViewCell {
    static let reuseIdentifier = "categoryCellId"
    
    lazy var animatedImage: GIFImageView = {
        let aniImage = GIFImageView()
        aniImage.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        aniImage.contentMode = .scaleToFill
        aniImage.clipsToBounds = true
        aniImage.animate(withGIFNamed: "veggiegif")
        aniImage.translatesAutoresizingMaskIntoConstraints = false
        aniImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        aniImage.layer.cornerRadius = 12
        aniImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return aniImage
    }()
    
    // CollectionViewCell has a property called isHighlighted. We can observe when it sets and run animation.
     override var isHighlighted: Bool {
         didSet {
             var transform : CGAffineTransform = .identity
             if isHighlighted {
                 print("Cell is highlighted \(isHighlighted)")
                 transform = .init(scaleX: 0.9, y: 0.9)
             }
             print("No Longer Highlighted: \(isHighlighted)")
             UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                 self.transform = transform
             })
         }
         
     }
     
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellShadow()
        addSubview(animatedImage)
        
        delay(5) {
            self.animatedImage.stopAnimatingGIF()
        }
        
        
        animatedImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        animatedImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        animatedImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        animatedImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    
    fileprivate func  setupCellShadow() {
        self.backgroundView = UIView()
        addSubview(self.backgroundView!)
        
        self.backgroundView?.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView?.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.backgroundView?.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.backgroundView?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.backgroundView?.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 12
        self.backgroundView?.layer.shadowOpacity = 0.3
        self.backgroundView?.layer.shadowRadius = 10
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
        self.backgroundView?.layer.shouldRasterize = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
