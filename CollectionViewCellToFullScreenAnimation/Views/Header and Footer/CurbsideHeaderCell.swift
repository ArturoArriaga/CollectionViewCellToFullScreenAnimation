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
    
    let mapsImageView: UIImageView = {
        let mapsImage = UIImageView(image: #imageLiteral(resourceName: "mapsIcon.jpg"))
        mapsImage.contentMode = .scaleAspectFill
        mapsImage.layer.cornerRadius = 40
        mapsImage.layer.borderWidth = 4
        mapsImage.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
        mapsImage.clipsToBounds = true
        mapsImage.translatesAutoresizingMaskIntoConstraints = false
        mapsImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        mapsImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return mapsImage
    }()
    
    
    let findLocationLabel = UILabel(text: "Find my store", font: .systemFont(ofSize: 16, weight: .regular), numberOfLines: 1)
    
    let headerCellLabel : UILabel = {
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
    
    let curbsideLabel : UILabel = {
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
    
    lazy var headerView: UIImageView = {
        let hv = UIImageView()
        hv.contentMode = .scaleAspectFill
        hv.clipsToBounds = true
        hv.backgroundColor = .white
        hv.image = UIImage(named: "trees2")
        hv.translatesAutoresizingMaskIntoConstraints = false
        hv.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        hv.layer.cornerRadius = 20
        hv.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return hv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        
        findLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setupLayout()
        findLocationLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
//        delay(4) {
//            self.headerView.stopAnimatingGIF()
//        }
    }
    
    fileprivate func setupLayout() {
        [headerCellLabel, curbsideLabel, mapsImageView, findLocationLabel].forEach { (v) in
//            v.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(v)
            
        }
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerCellLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -38),
            headerCellLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            curbsideLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            curbsideLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            mapsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            mapsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            
            findLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            findLocationLabel.topAnchor.constraint(equalTo: curbsideLabel.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
