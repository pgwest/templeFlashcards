//
//  CustomCollectionCell.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/6/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit


class CustomCollectionCell : UICollectionViewCell {
    
    // Mark: - View life cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        customView.image = UIImage()
        customView.templeName = ""
        customView.templeFileName = ""
        customView.label.removeFromSuperview()
        customView.label = UILabel()
        self.layer.borderColor = UIColor.clear.cgColor
        
        customView.setNeedsDisplay()
        // Remove the circle in subview here...
    }
    
    // Mark: - Outlets
    
    @IBOutlet weak var customView: CustomCellView!
    
    // Mark: - Helpers
    
    func updateCellView(notification: Notification) {
        customView.setNeedsDisplay()
        
    }
    
    
}
