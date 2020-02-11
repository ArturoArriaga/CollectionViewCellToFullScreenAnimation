//
//  AdvertisementCell.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/29/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class AdvertisementCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "yourAd"))
    
    let adLabel: UILabel = {
        let l = UILabel(text: "ad", font: UIFont.boldSystemFont(ofSize: 20))
        l.textColor = .black
        l.backgroundColor = UIColor(white: 1, alpha: 0.6)
        l.layer.cornerRadius = 23
        l.textAlignment = .center
        l.clipsToBounds = true
        l.translatesAutoresizingMaskIntoConstraints = false
        l.heightAnchor.constraint(equalToConstant: 46).isActive = true
        l.widthAnchor.constraint(equalToConstant: 46).isActive = true
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 12
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.addSubview(imageView)
        self.clipsToBounds = true
        setupImageView()
        setupLayout()
    }
    
    fileprivate func setupImageView() {
        imageView.addSubview(adLabel)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            adLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 52),
            adLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
