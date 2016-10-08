//
//  ViewController.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/6/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("updateScore")
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateScore(notification:)), name: notificationName, object: nil)
        

    }
    

    
    var hideTable = true
    
    static var score = 0
    
    @IBAction func studyMode(_ sender: AnyObject) {
        if hideTable == false {
            
            tableViewWidthConstraint.constant = UIScreen.main.bounds.width * 0.66
            CustomCellView.studyMode = false
            let notificationName = Notification.Name("load")
            NotificationCenter.default.post(name: notificationName, object: nil)
//            CardViewController.update()
            hideTable = true
            resetGame()
        }
        else{
            tableViewWidthConstraint.constant = UIScreen.main.bounds.width//720
            CustomCellView.studyMode = true
            let notificationName = Notification.Name("load")
            NotificationCenter.default.post(name: notificationName, object: nil)
            hideTable = false
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBOutlet weak var tableViewWidthConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var score: UIBarButtonItem!
    
    @IBAction func startOver(_ sender: AnyObject) {
        resetGame()

        
    }
    
    func updateScore(notification: Notification){
        score.title = "\(ViewController.score)/42"
    }
    
    func resetGame() {
        CurrentFlashcardList.flashcardList = FlashcardList.permanentList
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
    }
    
}
