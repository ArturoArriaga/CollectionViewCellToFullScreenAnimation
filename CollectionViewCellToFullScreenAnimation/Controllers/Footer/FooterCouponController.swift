//
//  FooterCouponController.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/3/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class FooterCouponController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let couponId = "couponId"
    
//    var didSelecthandler: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = #colorLiteral(red: 0.9530013204, green: 0.9494226575, blue: 0.9284337759, alpha: 1)
        self.collectionView.register(CouponCell.self, forCellWithReuseIdentifier: couponId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    
    let imageView = UIImageView(image: UIImage(named: "coupon.tide"))
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: couponId, for: indexPath) as! CouponCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 50, height: 70)
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .normal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Going away")
    }
}
