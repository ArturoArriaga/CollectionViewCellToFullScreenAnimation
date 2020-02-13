//
//  CouponFooterCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/3/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class CouponFooterCell: UICollectionViewCell {
    
    let titleLabel: CustomLabel = {
        let tl = CustomLabel(dxPadding: 10, dyPadding: 0, height: 30)
        tl.text = "10% off your next purchase! 🥳"
        tl.font = UIFont(name: "Rubik-Regular", size: 18)
        tl.textAlignment = .left
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textColor = #colorLiteral(red: 0.9530013204, green: 0.9494226575, blue: 0.9284337759, alpha: 1)
        tl.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return tl
    }()
    
    let couponController : UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        let label = CustomLabel(dxPadding: 10, dyPadding: 10, height: 40)
        label.text = "REDEEM NOW"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        v.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        label.backgroundColor = .red
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        addSubview(titleLabel)
        couponController.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            couponController.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            couponController.leadingAnchor.constraint(equalTo: leadingAnchor),
            couponController.trailingAnchor.constraint(equalTo: trailingAnchor),
            couponController.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
