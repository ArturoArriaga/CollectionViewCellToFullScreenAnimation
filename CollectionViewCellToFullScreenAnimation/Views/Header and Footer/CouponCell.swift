//
//  CouponCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/11/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class CouponCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("cell is disappearing")
    }
}
