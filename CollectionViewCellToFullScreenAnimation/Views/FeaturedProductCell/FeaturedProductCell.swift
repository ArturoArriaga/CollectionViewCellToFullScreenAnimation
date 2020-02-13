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
    
    var featuredProduct: FeaturedItem! {
        didSet {
            self.imageView.image = UIImage(named: featuredProduct.image)
            self.titleLabel.text = featuredProduct.title
            self.highLightLabel.backgroundColor = featuredProduct.color
            self.highLightLabel.text = featuredProduct.labelTitle
        }
    }
    
        
    var imageView = UIImageView(image: UIImage(named: "veggies"))
    var titleLabel = UILabel(text: "The best deals on freshest produce.", font: .systemFont(ofSize: 24), numberOfLines: 0)
    
    let highLightLabel : CustomLabel = {
        let l = CustomLabel(dxPadding: 0, dyPadding: 15, height: 35)
        l.text = "Texas Made"
        l.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        l.backgroundColor = #colorLiteral(red: 0.339337945, green: 0.950001657, blue: 0.1244122311, alpha: 1)
        l.font = UIFont(name: "Rubik-Medium", size: 20)
        l.textAlignment = .center
        l.layer.cornerRadius = 8
        l.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        l.clipsToBounds = true
        l.translatesAutoresizingMaskIntoConstraints = false
        l.widthAnchor.constraint(greaterThanOrEqualToConstant: 175).isActive = true
        l.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return l
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
        addSubview(imageView)
        addSubview(highLightLabel)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 12
        
        NSLayoutConstraint.activate([
            highLightLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            highLightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
        
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.clipsToBounds = true
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
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
