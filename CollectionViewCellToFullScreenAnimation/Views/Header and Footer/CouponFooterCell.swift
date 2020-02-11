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
        let tl = CustomLabel(dxPadding: 0, dyPadding: 0, height: 30)
        tl.text = "OMG COUPONS! 🥳"
        tl.font = UIFont(name: "Rubik-Regular", size: 18)
        tl.textAlignment = .center
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textColor = #colorLiteral(red: 0.9530013204, green: 0.9494226575, blue: 0.9284337759, alpha: 1)
        tl.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return tl
    }()
    
    var couponController = FooterCouponController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        addSubview(titleLabel)
        addSubview(couponController.view)
        couponController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            couponController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            couponController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            couponController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            couponController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
