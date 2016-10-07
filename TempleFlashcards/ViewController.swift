//
//  ViewController.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/6/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    
    var hide = false
    
    
    @IBAction func studyMode(_ sender: AnyObject) {
        if hide == true {
            tableViewWidthConstraint.constant = 442
            hide = false
        }
        else{
            tableViewWidthConstraint.constant = UIScreen.main.bounds.width//720
            hide = true
        }
        UIView.animate(withDuration: 1.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBOutlet weak var tableViewWidthConstraint: NSLayoutConstraint!
    
    
    
    
}
