//
//  ViewController.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/6/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    // Mark: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("updateScore")
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateScore(notification:)), name: notificationName, object: nil)
        
        tableViewWidthConstraint.constant = UIScreen.main.bounds.width * 0.66

    }
    

    // Mark: - Properties
    
    var hideTable = true
    
    static var score = 0
    
    
    // Mark: - outlets
    
    @IBOutlet weak var studyModeButton: UIBarButtonItem!
    
    @IBAction func studyMode(_ sender: AnyObject) {
        self.view.layoutIfNeeded()
        if hideTable == false {
            
            tableViewWidthConstraint.constant = UIScreen.main.bounds.width * 0.66
            CustomCellView.studyMode = false
            studyModeButton.title = "Study Mode"
            
            let notificationName = Notification.Name("load")
            NotificationCenter.default.post(name: notificationName, object: nil)
            
            hideTable = true
            //resetGame()
        }
        else{
            
            tableViewWidthConstraint.constant = UIScreen.main.bounds.width//720
            CustomCellView.studyMode = true
            studyModeButton.title = "Game Mode"
            
            let notificationName = Notification.Name("load")
            NotificationCenter.default.post(name: notificationName, object: nil)
            hideTable = false
        }

        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        if hideTable {
            resetGame()
        }
    }
    
    
    @IBOutlet weak var tableViewWidthConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var score: UIBarButtonItem!
    
    @IBAction func startOver(_ sender: AnyObject) {
        resetGame()

        
    }
    
    // Mark: - helpers
    
    func updateScore(notification: Notification){
        score.title = "\(ViewController.score)/42"
    }
    
    func resetGame() {
        
//        print("reset game")
        CurrentFlashcardList.flashcardList = FlashcardList()
        
        score.title = "0/42"
        ViewController.score = 0
        
        let notificationName = Notification.Name("load")
        NotificationCenter.default.post(name: notificationName, object: nil)
        CardViewController.isSelected = false
        CardViewController.selectedIndexPath = IndexPath()
        
        let notificationName1 = Notification.Name("loadTable")
        NotificationCenter.default.post(name: notificationName1, object: nil)
        NameViewController.isSelected = false
        
        self.view.setNeedsDisplay()
        self.view.layoutIfNeeded()
    }
    
}
