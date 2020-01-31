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
    
    let nameLabel : UILabel = {
        let l = UILabel()
        l.text = "James Dunn"
        l.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        l.backgroundColor = UIColor(white: 0.9, alpha: 0.7)
        l.font = .boldSystemFont(ofSize: 20)
        l.textAlignment = .center
        l.layer.cornerRadius = 12
        l.clipsToBounds = true
        l.translatesAutoresizingMaskIntoConstraints = false
        l.heightAnchor.constraint(equalToConstant: 30).isActive = true
        l.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return l
    }()
    
    let accountImageView : UIImageView = {
        let im = UIImageView(image: UIImage(named: "man"))
        im.contentMode = .center
        im.layer.cornerRadius = 32
        im.layer.borderColor = UIColor(white: 0.7, alpha: 0.7).cgColor
        im.layer.borderWidth = 1
        im.clipsToBounds = true
        im.translatesAutoresizingMaskIntoConstraints = false
        im.heightAnchor.constraint(equalToConstant: 64).isActive = true
        im.widthAnchor.constraint(equalToConstant: 64).isActive = true
        return im
    }()
    
    let headerView: GIFImageView = {
        let hv = GIFImageView()
        hv.contentMode = .scaleAspectFill
        hv.clipsToBounds = true
        hv.animate(withGIFNamed: "food")
        hv.backgroundColor = .white
        hv.translatesAutoresizingMaskIntoConstraints = false
        hv.heightAnchor.constraint(equalToConstant: 130).isActive = true
        hv.widthAnchor.constraint(equalToConstant: 370).isActive = true
        hv.layer.cornerRadius = 12
        return hv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        headerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        headerView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        headerView.addSubview(accountImageView)
        accountImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        accountImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45).isActive = true
        
        delay(2.4) {
            self.headerView.stopAnimatingGIF()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
