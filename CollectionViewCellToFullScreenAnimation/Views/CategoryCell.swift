//
//  CollectionViewCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/27/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    // reuseIdentifier encapsulated within cell.
    static let reuseIdentifier = "featuredProductCellId"
    
    let categoryLabel : UILabel = {
        let cl = UILabel(text: "  Shop today's biggest deals", font: UIFont(name: "Rubik-Regular", size: 18)!, numberOfLines: 0)
        cl.textColor = #colorLiteral(red: 0.1578280926, green: 0.5385968685, blue: 0.5154026151, alpha: 1)
        cl.backgroundColor = .white
        cl.translatesAutoresizingMaskIntoConstraints = false
        cl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return cl
    }()
    
    let width: CGFloat = 125
    
    lazy var v: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.widthAnchor.constraint(equalToConstant: width).isActive = true
        return v
    }()
    
    lazy var v2: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.widthAnchor.constraint(equalToConstant: width).isActive = true
        return v
    }()
    
    lazy var v3: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.widthAnchor.constraint(equalToConstant: width).isActive = true
        return v
    }()
    
    lazy var stackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [v, v2, v3])
        sv.spacing = 12
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        return sv
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
        addSubview(categoryLabel)
        addSubview(stackView)
        
//        self.addSubview(imageView)
//
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            stackView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
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
        self.backgroundView?.layer.shadowOpacity = 0.3
        self.backgroundView?.layer.shadowRadius = 10
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
        self.backgroundView?.layer.shouldRasterize = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
