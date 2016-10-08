//
//  CustomCellView.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/6/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class CustomCellView : UIView {
    
    // Mark: - Properties
    
    static var studyMode = false
    
    var templeName = ""  //"campinas-brazil-temple-lighted-1029894-mobile"

    var templeFileName = ""
    
    var image = UIImage()
    
    var label = UILabel()
    
    
    
    
    // Mark: - Draw View
    
    override func draw(_ rect: CGRect) {
        
       image = UIImage(named: templeFileName)!
        image.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: bounds.width, height: bounds.width))) // bounds) //want to be 98x98

        
        if CustomCellView.studyMode {
            
            
            let bannerWidth = bounds.width
            

            
            let requiredLabelHeight = requiredHeight()
            let labelRect = CGRect(x: 0.0, y: bounds.width - requiredLabelHeight, width: bannerWidth, height: requiredLabelHeight)
            label = UILabel(frame: labelRect)
            label.numberOfLines = 0
            label.text = templeName//"Hello!"
            let font = UIFont(name: "Palatino-Bold", size: 10)
            label.font = font
            label.adjustsFontSizeToFitWidth = true
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
            self.addSubview(label)
            
        }
        
        
    }
    
    
    // Mark: - Helpers
    
    // adapted from http://stackoverflow.com/questions/25180443/adjust-uilabel-height-to-text 
    
    func requiredHeight() -> CGFloat{
        
        let myLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        myLabel.numberOfLines = 0
        myLabel.text = templeName
        myLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        let font = UIFont(name: "Palatino-Bold", size: 10)
        myLabel.font = font
        
        myLabel.sizeToFit()
        
        return myLabel.frame.height
    }
    

}
