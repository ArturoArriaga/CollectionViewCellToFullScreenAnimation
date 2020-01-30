//
//  CollectionViewCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/27/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    // reuseIdentifier encapsulated within cell.
    static let reuseIdentifier = "collectionViewCellId"
    let gradientLayer = CAGradientLayer()
    
    let imageView: UIImageView = {
        let imv = UIImageView(image: UIImage(named: "banana")!)
        imv.contentMode = .scaleAspectFill
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imv.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return imv
        
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
        self.backgroundColor = UIColor.white
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    fileprivate func  setupCellShadow() {
        self.backgroundView = UIView()
        addSubview(self.backgroundView!)
        
        self.backgroundView?.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView?.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.backgroundView?.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.backgroundView?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.backgroundView?.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        self.backgroundView?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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
