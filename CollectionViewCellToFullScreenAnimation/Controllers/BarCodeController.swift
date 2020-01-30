//
//  BarCodeController.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/29/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class BarCodeControler: UIViewController, CAAnimationDelegate {
    
    let gradientLayer = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    
    // current gradient Index
    var currentGradient: Int = 0
    
    let color1 = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor
    let color2 = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor
    let color3 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createGradientView()
    }
    
    fileprivate func createGradientView () {
        //overlap the colors and make it 3 sets of colors
        gradientSet.append([color1, color2])
        gradientSet.append([color2, color3])
        gradientSet.append([color3, color2])
        
        //set gradient size to the be the size of the screen
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = gradientSet[currentGradient]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.drawsAsynchronously = true
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        animateGradientLayer()
        
    }
    
    fileprivate func animateGradientLayer() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 5
        gradientAnimation.toValue = gradientSet[currentGradient]
        gradientAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.delegate = self
        gradientLayer.add(gradientAnimation, forKey: "gradientChangeAnimation")
        
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradientLayer.colors = gradientSet[currentGradient]
            animateGradientLayer()
        }
    }
    
}
