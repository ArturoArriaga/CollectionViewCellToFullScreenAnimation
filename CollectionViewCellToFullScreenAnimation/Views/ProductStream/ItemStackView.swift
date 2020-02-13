//
//  itemStackView.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/31/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class ItemStackView : UIStackView {
    
    let imageView : UIImageView  = {
        let iv = UIImageView(image: UIImage(named: "veggies4"))
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 12
        iv.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 88).isActive = true
        return iv
    }()
    
    let sponseredLabel: UILabel = {
        let v = UILabel(text: " Sponsered", font: UIFont(name: "Rubik-Regular", size: 12)!, numberOfLines: 1)
        v.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        v.backgroundColor = .white
        return v
    }()
    
    let priceLabel: UILabel = {
        let v = UILabel(text: "", font: UIFont(name: "Rubik-Regular", size: 14)!, numberOfLines: 1)
        v.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return v
    }()
    
    let discountedPriceLabel: UIView = {
        let v = UILabel(text: " $ 4.36", font: UIFont(name: "Rubik-Regular", size: 15)!, numberOfLines: 1)
        v.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return v
    }()
    
    let productName: UILabel = {
        let v = UILabel(text: " Jif Extra Crunchy \n Peanut Butter", font: UIFont(name: "Rubik-Light", size: 10)!, numberOfLines: 2)
        v.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 26).isActive = true
        return v
    }()
    
    let addProductButton: UIButton = {
        let v = UIButton(title: " I'll take it +")
        v.setTitleColor(#colorLiteral(red: 0.1976185143, green: 0.6454345584, blue: 0.5728806853, alpha: 1), for: .normal)
        v.titleLabel?.font = UIFont(name: "Rubik-Light", size: 15)
        v.titleLabel?.textAlignment = .right
        v.backgroundColor = .white
        v.layer.cornerRadius = 2
        v.layer.borderColor = #colorLiteral(red: 0.1976185143, green: 0.6454345584, blue: 0.5728806853, alpha: 1).cgColor
        v.layer.borderWidth = 2
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return v
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.distribution = .fill
        self.axis = .vertical
        self.widthAnchor.constraint(equalToConstant: 125).isActive = true
        self.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        [imageView, sponseredLabel, priceLabel, discountedPriceLabel, productName, addProductButton ].forEach { (view) in
            self.addArrangedSubview(view)
        }
        
        [ priceLabel, discountedPriceLabel].forEach { (v) in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 22).isActive = true
            v.backgroundColor = .white
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
        
    
    
    
    
    
    
}
