//
//  CustomCellView.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/6/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class CustomCellView : UIView {
    
    var studyMode = false
    
    var templeName = ""  //"campinas-brazil-temple-lighted-1029894-mobile"

    var templeFileName = ""
    
    override func draw(_ rect: CGRect) {
        
        UIImage(named: templeFileName)?.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: bounds.width, height: bounds.width))) // bounds) //want to be 98x98
//        print("bounds height", bounds.height)
//        print("bounds width", bounds.width)
//        print("the temple name is,", templeName)
    
        
        let banner = UIBezierPath(roundedRect: bounds, cornerRadius: 5)
        
        banner.addClip()
        
        //UIColor.black.setFill()
        UIColor.black.withAlphaComponent(0.8).setFill()
        
        
        
        if let font = UIFont(name: "Palatino-Bold", size: 50) {
            
            let templeText = NSAttributedString(string: templeName, attributes: [NSFontAttributeName: font, NSForegroundColorAttributeName : UIColor.black])
            
            templeText.draw(at: CGPoint(x: 10, y: 50))
            
            
        }
        
        
    }
    

}
