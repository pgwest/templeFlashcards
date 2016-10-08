//
//  CustomCellView.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/6/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class CustomCellView : UIView {
    
    static var studyMode = false
    
    var templeName = ""  //"campinas-brazil-temple-lighted-1029894-mobile"

    var templeFileName = ""
    
    
    
    override func draw(_ rect: CGRect) {
        
        UIImage(named: templeFileName)?.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: bounds.width, height: bounds.width))) // bounds) //want to be 98x98
//        print("bounds height", bounds.height)
//        print("bounds width", bounds.width)
//        print("the temple name is,", templeName)
    
        print("the study mode is", CustomCellView.studyMode)
        if CustomCellView.studyMode {
            
            //let banner = UIBezierPath()
            
            let bannerWidth = bounds.width
            //let bannerHeight = bounds.width * 0.10
            

            
            let requiredLabelHeight = requiredHeight()
            //print("requried height", requiredLabelHeight)
            let labelRect = CGRect(x: 0.0, y: bounds.width - requiredLabelHeight, width: bannerWidth, height: requiredLabelHeight)
            let label = UILabel(frame: labelRect)
            label.numberOfLines = 0
            label.text = templeName//"Hello!"
            let font = UIFont(name: "Palatino-Bold", size: 10)
            label.font = font
            label.adjustsFontSizeToFitWidth = true
            //label.sizeToFit()
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.backgroundColor = UIColor.black.withAlphaComponent(0.6)


            
            
            self.addSubview(label)
            
            /*
            
            //let labelHeight = label.frame.height
            let labelHeight = label.intrinsicContentSize.height
            print(label.attributedText?.size().height)
            print("label height", labelHeight)
            
            banner.lineWidth = 0.0
            banner.move(to: CGPoint(x: 0, y: bounds.width - labelHeight))
            banner.addLine(to: CGPoint(x: bannerWidth, y: bounds.width - labelHeight))
            banner.addLine(to: CGPoint(x: bannerWidth, y: bounds.width))
            banner.addLine(to: CGPoint(x: 0, y: bounds.width))
            banner.close()
            //let context = UIGraphicsGetCurrentContext()
            //context!.setBlendMode(CGBlendMode.clear)
            banner.stroke()
            //context!.setBlendMode(CGBlendMode.color)
            //UIColor.black.setFill()
            UIColor.black.withAlphaComponent(0.7).setFill()
            banner.fill()
            */

            
/*            if let font = UIFont(name: "Palatino-Bold", size: 10) {
                let paraStyle = NSMutableParagraphStyle()
                paraStyle.lineSpacing = 6.0
                paraStyle.alignment = NSTextAlignment.center
                
                let templeText = NSAttributedString(string: templeName, attributes: [NSFontAttributeName: font, NSForegroundColorAttributeName : UIColor.white, NSParagraphStyleAttributeName: paraStyle])
                templeText.draw(at: CGPoint(x: 0.0, y: bounds.width - bannerHeight))
 
            }
 */
        }
        
        
    }
    
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
