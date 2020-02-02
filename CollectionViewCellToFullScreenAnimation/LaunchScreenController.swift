//
//  LaunchScreenController.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/1/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit



class LaunchScreenController: UIViewController {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named:"launchVeggies")!)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 410).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 410).isActive = true
        return iv
    }()
    
    override func viewDidLoad() {
        print("launch screen did run")
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9965345263, green: 0.9966737628, blue: 0.9964907765, alpha: 1)
        view.addSubview(imageView)
        
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        
    
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2) {
            self.imageView.alpha = 0
        }
        
        delay(2) {
            self.presentingViewController?.dismiss(animated: true)
        }
        
    }
    
    
}
