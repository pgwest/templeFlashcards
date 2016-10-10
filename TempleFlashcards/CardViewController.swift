//
//  CardViewController.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/4/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class CardViewController: UICollectionViewController {
    
    
    //Mark: - Constants
    
    static var selectedIndexPath = IndexPath()
    
    static var isSelected = false
    
    
    
    // Mark: - View lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationName = Notification.Name("load")
        NotificationCenter.default.addObserver(self, selector: #selector(CardViewController.loadList), name: notificationName, object: nil)
    }

    
    
    
    // Mark: - Collection view data source
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CurrentFlashcardList.flashcardList.templeList.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TempleNameCell", for: indexPath)
        
        if let customCell = cell as? CustomCollectionCell {
            
            customCell.customView.templeFileName = CurrentFlashcardList.flashcardList.templeList[indexPath.row].fileName
            customCell.customView.templeName = CurrentFlashcardList.flashcardList.templeList[indexPath.row].name
            customCell.layer.borderWidth = 4.0
            
            if (indexPath == CardViewController.selectedIndexPath) {
                
                customCell.layer.borderColor = UIColor.gray.cgColor
            }
            else{
                
                customCell.layer.borderColor = UIColor.clear.cgColor
            }
            
            return customCell
        }
        else{
            print("just cell")
            cell.backgroundColor = UIColor.black
            
        return cell
        }
    }
    
    
    
    
    // Mark: - Collection view delegate
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
        highlightCells(indexPath: indexPath)
        
        answerSelected(indexPath: indexPath)

        
    }
    
    
    
    
    // Mark: - Helpers
    
    
    func answerSelected(indexPath: IndexPath){
        if (CardViewController.isSelected){
            
            if(NameViewController.isSelected){
                
                if (CardViewController.selectedIndexPath.item == NameViewController.selectedIndexPath.item){
                    
                    //remove correct answers and fix score
                    CurrentFlashcardList.flashcardList.templeList.remove(at: CardViewController.selectedIndexPath.item)
                    ViewController.score += 1
                    
                    //Reset selection
                    CardViewController.isSelected = false
                    NameViewController.isSelected = false
                    CardViewController.selectedIndexPath = IndexPath()
                    
                    //Reload views
                    let notificationName = Notification.Name("loadTable")
                    NotificationCenter.default.post(name: notificationName, object: nil)
                    let notificationName1 = Notification.Name("updateScore")
                    NotificationCenter.default.post(name: notificationName1, object: nil)
                    collectionView?.reloadData()
                    correctAlert()
                }
                else{
                    
                    incorrectAlert()
                }
            }
        }
        
    }
    
    func correctAlert() {
        let alertController = UIAlertController(title: "Correct Answer", message:
            "You answered right!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func incorrectAlert() {
        let alertController = UIAlertController(title: "Incorrect Answer", message:
            "You answered wrong! :(", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func highlightCells(indexPath: IndexPath) {
        if  !CustomCellView.studyMode {
            
            if CardViewController.selectedIndexPath.indices.count == 0 {
                
                CardViewController.selectedIndexPath = indexPath
                let cell = collectionView?.cellForItem(at: indexPath)
                cell?.layer.borderWidth = 4.0
                cell?.layer.borderColor = UIColor.gray.cgColor
                CardViewController.isSelected = true
            }
            else{
                
                if let oldCell = collectionView?.cellForItem(at: CardViewController.selectedIndexPath) {
                    
                    oldCell.layer.borderWidth = 4.0
                    oldCell.layer.borderColor = UIColor.clear.cgColor
                }

                if(CardViewController.selectedIndexPath == indexPath && CardViewController.isSelected){
                    
                    CardViewController.isSelected = false
                }
                else{
                    
                    let cell = collectionView?.cellForItem(at: indexPath)
                    cell?.layer.borderWidth = 4.0
                    cell?.layer.borderColor = UIColor.gray.cgColor
                    CardViewController.isSelected = true
                }
                CardViewController.selectedIndexPath = indexPath
            }
        }
        else {
            
            let cell = collectionView?.cellForItem(at: indexPath)
            cell?.layer.borderWidth = 4.0
            cell?.layer.borderColor = UIColor.clear.cgColor

        }
    }
    



    func loadList(notification: Notification){
        if CardViewController.selectedIndexPath != IndexPath() {
            
            self.collectionView?.cellForItem(at: CardViewController.selectedIndexPath)?.layer.borderWidth = 4.0
            self.collectionView?.cellForItem(at: CardViewController.selectedIndexPath)?.layer.borderColor = UIColor.clear.cgColor
            print("color cleared")
            print(CardViewController.selectedIndexPath)
        }
        self.collectionView?.reloadData()
    }
    

    
    
    
}
