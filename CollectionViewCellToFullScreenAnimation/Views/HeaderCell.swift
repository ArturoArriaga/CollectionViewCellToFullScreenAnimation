//
//  HeaderCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/29/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit
import Gifu

func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

class HeaderCell: UICollectionReusableView {
    
    let headerView: GIFImageView = {
        let hv = GIFImageView()
        hv.contentMode = .scaleAspectFill
        hv.clipsToBounds = true
        hv.animate(withGIFNamed: "food")
        hv.backgroundColor = .white
        hv.translatesAutoresizingMaskIntoConstraints = false
        hv.heightAnchor.constraint(equalToConstant: 135).isActive = true
        hv.widthAnchor.constraint(equalToConstant: 375).isActive = true
        hv.layer.cornerRadius = 12
        return hv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        headerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        
        delay(2.4) {
            self.headerView.stopAnimatingGIF()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
