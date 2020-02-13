//
//  ContentView.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/27/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//
import UIKit

class RootViewController: BaseCollectionViewController {
    //MARK: Instance Properites
    fileprivate var origninalStartingFrame: CGRect?
    
    //anchors for animation.
    fileprivate var topAnchor : NSLayoutConstraint?
    fileprivate var leadingAnchor : NSLayoutConstraint?
    fileprivate var widthAnchor : NSLayoutConstraint?
    fileprivate var heightAnchor : NSLayoutConstraint?
    
    var fullscreenViewController : FullScreenController!

    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupNavigationBar()
        registerCollectionViewCells()
        self.collectionView.reloadData()
    }
    
    //Cell Registration
    fileprivate func registerCollectionViewCells() {
        self.collectionView.register(ProductStreamCell.self, forCellWithReuseIdentifier: ProductStreamCell.reuseIdentifier)
        self.collectionView.register(FeaturedProductCell.self, forCellWithReuseIdentifier: FeaturedProductCell.reuseIdentifier)
        self.collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.reuseIdentifier)
//        self.collectionView.register(CouponFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9289988279, green: 0.9077536464, blue: 0.8706553578, alpha: 1)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Thrive Mart", attributes: [
            .font : UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: color
        ])
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true        
     
    }
 
}

// MARK: Navigation
extension RootViewController {
}


/* This algorithm animates a cell to fullscreen and then back when the user desires. */
//MARK: Did Select Item
//Animation to full screen (0/3)
extension RootViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 1,3:
            launchToFullScreen(indexPath)
        default:
            break
        }
    }
    //MARK: Launching to full screen
    // Animation to full screen (1/3)
     func launchToFullScreen (_ indexPath: IndexPath) {
        setupFullScreenController(indexPath)
        setupFullScreenStartingPosition(indexPath)

        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            // Setting constants to cover the screen.
            self.navigationController?.navigationBar.isHidden = true
            self.topAnchor?.constant = 0
            self.leadingAnchor?.constant = 0
            self.widthAnchor?.constant = self.view.frame.width
            self.heightAnchor?.constant = self.view.frame.height
            self.view.layoutIfNeeded() // launches animation
            
        }, completion: nil)
        
    }
    //Animation to full screen (2/3)
    fileprivate func setupFullScreenController(_ indexPath: IndexPath) {
        let fsc = FullScreenController()
        fsc.featuredProduct = FeaturedItems.productStream[indexPath.item]
        fsc.view.layer.cornerRadius = 12
        self.fullscreenViewController = fsc
    }
    //Animation to full screen (3/3)
    fileprivate func setupFullScreenStartingPosition(_ indexPath: IndexPath) {
        print("Setting up Starting Position")
        let fscv = fullscreenViewController.view!
        fscv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveView)))
        
        view.addSubview(fscv)
        fscv.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(fullscreenViewController)
        self.collectionView.isUserInteractionEnabled = false
        
        calculateStartingCellFrame(indexPath)
        
        guard let frameLocationWhenTapped = self.origninalStartingFrame else { return }
        // Anchor the view to the cell's frame. The constants set the view right on top of the cell.
        self.topAnchor = fscv.topAnchor.constraint(equalTo: self.view.topAnchor, constant: frameLocationWhenTapped.origin.y)
        self.leadingAnchor = fscv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: frameLocationWhenTapped.origin.x)
        self.widthAnchor = fscv.widthAnchor.constraint(equalToConstant: frameLocationWhenTapped.width)
        self.heightAnchor = fscv.heightAnchor.constraint(equalToConstant: frameLocationWhenTapped.height)
        
        [topAnchor, leadingAnchor, widthAnchor, heightAnchor].forEach {$0?.isActive = true}
        self.view.layoutIfNeeded()
        
    }
    
    fileprivate func calculateStartingCellFrame (_ indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        // Make a copy of the frame so that the fsc.view can put put on top of it.
        guard let frameLocationWhenTapped = cell.superview?.convert(cell.frame, to: nil) else { return }
        // Save of a copy of the originalFrame
        self.origninalStartingFrame = frameLocationWhenTapped
    }

    //MARK: Removal/Dimsissal of Fullscreen controller
    @objc fileprivate func handleRemoveView(gesture: UITapGestureRecognizer) {
    // The opposite of the other animation method. Constants set back to the their original position.
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.navigationController?.navigationBar.isHidden = false
            
            guard let backtoStartingFrame = self.origninalStartingFrame else { return }
            self.topAnchor?.constant = backtoStartingFrame.origin.y
            self.leadingAnchor?.constant = backtoStartingFrame.origin.x
            self.widthAnchor?.constant = backtoStartingFrame.width
            self.heightAnchor?.constant = backtoStartingFrame.height
            self.view.layoutIfNeeded() // Triggers animation.
            
        }, completion: { _ in
            self.fullscreenViewController.view.removeFromSuperview()
            self.fullscreenViewController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
            
        })
        
    }
}

// MARK: DelegateFlowLayout Methods.
// Conform to adjust size
extension RootViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return .init(width: self.view.frame.width, height: 180)
        }
        return .init(width: self.view.frame.width, height: 100)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return .init(width: self.view.frame.width, height: 150)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % 2 == 0 {
            return .init(width: self.view.frame.width, height: 250)
        }
        return .init(width: self.view.frame.width - 64, height: 370)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 10, right: 0)
    }
}


// MARK: DataSource and Delegate Methods
extension RootViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //TODO: Add footer cell
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseIdentifier, for: indexPath) as! HeaderCell
//            return headerView
//        case UICollectionView.elementKindSectionFooter:
//            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! CouponFooterCell
//            return footerView
//        default:
//            assert(false, "Unexpected")
//        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseIdentifier, for: indexPath) as! HeaderCell
        return headerView
    }
    //MARK: CellForItemAt 
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 1,3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedProductCell.reuseIdentifier, for: indexPath) as! FeaturedProductCell
            cell.featuredProduct = FeaturedItems.productStream[indexPath.item]
            return cell
        default:
            let productStreamCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductStreamCell.reuseIdentifier, for: indexPath) as! ProductStreamCell
            productStreamCell.categoryLabel.text = ProductSteamTitles.titles[indexPath.item]
            productStreamCell.horizontalProductController.products = ProductStreams.stream[indexPath.item]
            productStreamCell.horizontalProductController.adImage = AdStream.ads[indexPath.item]
            return productStreamCell
        }
    }
}

