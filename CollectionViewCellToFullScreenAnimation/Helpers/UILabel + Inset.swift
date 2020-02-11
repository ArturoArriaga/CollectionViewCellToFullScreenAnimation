//
//  UILabel + Inset.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 2/2/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

class CustomLabel : UILabel {

    let dxPadding: CGFloat
    let dyPadding: CGFloat
    let height: CGFloat
    
    init(dxPadding: CGFloat, dyPadding: CGFloat, height: CGFloat) {
        self.dxPadding = dxPadding
        self.dyPadding = dyPadding
        self.height = height
        
        super.init(frame: .zero)
    }
    
// Provides inset for text.
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.insetBy(dx: dxPadding, dy: dyPadding))
    }
// Provides size to be termined by the instance.
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
