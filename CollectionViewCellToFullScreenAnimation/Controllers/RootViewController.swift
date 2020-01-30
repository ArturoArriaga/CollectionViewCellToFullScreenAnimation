//
//  ContentView.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/27/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//
import UIKit

class RootViewController: BaseCollectionViewController {
    
    let blueView : UIView = {
        let bc = UIView()
        bc.backgroundColor = .blue
        bc.translatesAutoresizingMaskIntoConstraints = false
        bc.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return bc
    }()

   fileprivate var origninalStartingFrame: CGRect?
   fileprivate var topAnchor : NSLayoutConstraint?
   fileprivate var leadingAnchor : NSLayoutConstraint?
   fileprivate var widthAnchor : NSLayoutConstraint?
   fileprivate var heightAnchor : NSLayoutConstraint?
    
    let headerId = "headerId"
    let cellId = "Cellid"
    let adHeader = "adHeader"
    
//    let backgroundImage: UIImage = {
//        let im = UIImage()
//        im.withTintColor(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
//        return im
//    }()
    
    lazy var veggieImagePath: String = Bundle.main.path(forResource: "veggiegif", ofType: "gif")!
    
    var fullscreenViewController : FullScreenController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hi"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8726800444, green: 0.8202190767, blue: 0.732356349, alpha: 0.7715913955)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = .red
        self.navigationController?.navigationItem.leftBarButtonItem?.title = "Hi"
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Welcome"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)

        self.collectionView.backgroundColor = #colorLiteral(red: 0.9530013204, green: 0.9494226575, blue: 0.9284337759, alpha: 1)
        
        self.collectionView.register(FeaturedProductCell.self, forCellWithReuseIdentifier: FeaturedProductCell.reuseIdentifier)
        self.collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        
        self.collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        presentFirstRunController()
    }

    fileprivate func presentFirstRunController() {
        let lvc = BarCodeControler()
        self.modalPresentationStyle = .pageSheet
        self.present(lvc, animated: true)        
    }
    
}

// MARK: Navigation
/* This algorithm animates a cell to fullscreen and then back when the user desires. */
extension RootViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        launchToFullScreen(indexPath)
    }
    
    fileprivate func launchToFullScreen (_ indexPath: IndexPath) {
        setupFullScreenController(indexPath)
        setupFullScreenStartingPosition(indexPath)

        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            // Setting constants to cover the screen.
            self.topAnchor?.constant = 0
            self.leadingAnchor?.constant = 0
            self.widthAnchor?.constant = self.view.frame.width
            self.heightAnchor?.constant = self.view.frame.height
            self.view.layoutIfNeeded() // launches animation
            
        }, completion: nil)
        
    }
    
    fileprivate func setupFullScreenController(_ indexPath: IndexPath) {
        let fsc = FullScreenController()
        fsc.view.layer.cornerRadius = 12
        self.fullscreenViewController = fsc
        
    }
    
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

    
    @objc fileprivate func handleRemoveView(gesture: UITapGestureRecognizer) {
    // The opposite of the other animation method. Constants set back to the their original position.
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
//            self.fullscreenViewController.stackView.isHidden = true
            
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
            return .init(width: self.view.frame.width, height: 150)
        }
        return .init(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width - 64, height: 370)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
}


// MARK: DataSource and Delegate Methods
extension RootViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
            headerView.backgroundColor =  #colorLiteral(red: 0.8726800444, green: 0.8202190767, blue: 0.732356349, alpha: 0.77)
            return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 1:
            let baseCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedProductCell.reuseIdentifier, for: indexPath) as! FeaturedProductCell
            return baseCell
        case 3:
            let alcell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
            alcell.animatedImage.image = UIImage(named: "salmon")
            return alcell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
            return cell
        }
        
    }
}


import SwiftUI
struct ContentView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: ContentView.UIViewControllerType, context: UIViewControllerRepresentableContext<ContentView>) {
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ContentView>) -> UIViewController {
        return RootViewController()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().edgesIgnoringSafeArea(.all)
    }
}
