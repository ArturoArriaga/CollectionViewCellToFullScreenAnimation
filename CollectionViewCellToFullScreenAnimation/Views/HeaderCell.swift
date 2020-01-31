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
    static var reuseIdentifier = "headerCellId"
    
    let label1 : UILabel = {
        let l = UILabel()
        l.text = " That was easy"
        l.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        l.backgroundColor = #colorLiteral(red: 0.8718628287, green: 0.253423661, blue: 0.3765940666, alpha: 1)
        l.font = UIFont(name: "Rubik-Medium", size: 20)
        l.textAlignment = .center
        l.layer.cornerRadius = 8
        l.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        l.clipsToBounds = true
        l.translatesAutoresizingMaskIntoConstraints = false
        l.widthAnchor.constraint(equalToConstant: 150).isActive = true
        l.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return l
    }()
    
    let subLabel : UILabel = {
        let l = UILabel()
        l.text = "Curbside pickup \nnow available"
        l.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        l.font = UIFont(name: "Rubik-Medium", size: 22)
        l.textAlignment = .right
        l.layer.cornerRadius = 12
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.widthAnchor.constraint(equalToConstant: 175).isActive = true
        l.heightAnchor.constraint(equalToConstant: 55).isActive = true
        return l
    }()
    
    lazy var headerView: GIFImageView = {
        let hv = GIFImageView()
        hv.contentMode = .scaleAspectFill
        hv.clipsToBounds = true
        hv.animate(withGIFNamed: "drive")
        hv.backgroundColor = .white
        hv.translatesAutoresizingMaskIntoConstraints = false
        hv.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        hv.layer.cornerRadius = 20
        hv.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return hv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        clipsToBounds = true
        
        headerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        headerView.addSubview(label1)
        label1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -38).isActive = true
        label1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        headerView.addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        subLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        delay(4) {
            self.headerView.stopAnimatingGIF()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
