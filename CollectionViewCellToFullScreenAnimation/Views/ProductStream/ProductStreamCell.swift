//
//  CollectionViewCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/27/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.

import UIKit


class ProductStreamCell: UICollectionViewCell {
    static let reuseIdentifier = "productStreamId"
    
    var horizontalProductController = ProductStreamController()
    
    let categoryLabel : CustomLabel = {
        let cl = CustomLabel(dxPadding: 15, dyPadding: 0, height: 30)
        cl.text = "OMG DEALS"
        cl.font = UIFont(name: "Rubik-Regular", size: 16)
        cl.textColor = #colorLiteral(red: 0.5097460151, green: 0.5098373294, blue: 0.5097402334, alpha: 1)
        cl.backgroundColor = .white
        cl.translatesAutoresizingMaskIntoConstraints = false
        cl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return cl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellShadow()
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        addSubview(categoryLabel)
        addSubview(horizontalProductController.view)
        
        horizontalProductController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            horizontalProductController.view.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            horizontalProductController.view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            horizontalProductController.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            horizontalProductController.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
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
        
        self.backgroundView?.backgroundColor = #colorLiteral(red: 0.9530013204, green: 0.9494226575, blue: 0.9284337759, alpha: 1)
        self.backgroundView?.layer.shadowOpacity = 0.3
        self.backgroundView?.layer.shadowRadius = 3
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 3)
        self.backgroundView?.layer.shouldRasterize = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
