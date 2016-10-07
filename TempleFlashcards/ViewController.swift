//
//  ViewController.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/6/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    
    var hide = true
    
    
    @IBAction func studyMode(_ sender: AnyObject) {
        if hide == false {
            tableViewWidthConstraint.constant = 442
            CustomCellView.studyMode = false
            //let notificationName = Notification.Name("load")
            //NotificationCenter.default.post(name: notificationName, object: nil)
//            CardViewController.update()
            hide = true
        }
        else{
            tableViewWidthConstraint.constant = UIScreen.main.bounds.width//720
            CustomCellView.studyMode = true
            //let notificationName = Notification.Name("load")
            //NotificationCenter.default.post(name: notificationName, object: nil)
            hide = false
        }
        UIView.animate(withDuration: 1.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBOutlet weak var tableViewWidthConstraint: NSLayoutConstraint!
    
    
    
    
}
