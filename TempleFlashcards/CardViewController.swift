//
//  CardViewController.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/4/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class CardViewController: UICollectionViewController {
    
    
    static var selectedIndexPath = IndexPath()
    
    static var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationName = Notification.Name("load")
        //NotificationCenter.defaultCenter().addObserver(self, selector: "loadList:", name:"load", object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CardViewController.loadList), name: notificationName, object: nil)

        
    }

    
    // Mark: Collection view data source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CurrentFlashcardList.flashcardList.templeList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TempleNameCell", for: indexPath)
        
        if let customCell = cell as? CustomCollectionCell {
            customCell.customView.templeFileName = CurrentFlashcardList.flashcardList.templeList[indexPath.row].fileName
            customCell.customView.templeName = CurrentFlashcardList.flashcardList.templeList[indexPath.row].name
            return customCell
        }
        else{
            print("just cell")
            cell.backgroundColor = UIColor.black
            
        
        return cell
        }
    }
    
    
    // Mark: Collection view delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // what to do when selected
        
//        print("temple selected: ", CurrentFlashcardList.flashcardList.templeList[indexPath.row].name)
//        print("card index: ", indexPath.item)
  
        highlightCells(indexPath: indexPath)
        

        if (CardViewController.isSelected){
            if(NameViewController.isSelected){
                if (CardViewController.selectedIndexPath.item == NameViewController.selectedIndexPath.item){
                    
                    //remove correct answers
                    print("correct")
                    CurrentFlashcardList.flashcardList.templeList.remove(at: CardViewController.selectedIndexPath.item)
                    
                    //Reset selection
                    CardViewController.isSelected = false
                    NameViewController.isSelected = false
                    CardViewController.selectedIndexPath = IndexPath()
                    
                    //Reload views
                    let notificationName = Notification.Name("loadTable")
                    NotificationCenter.default.post(name: notificationName, object: nil)
                    collectionView.reloadData()
                }
                else{
                    print("incorrect")
                }
            }
        }
        
    }
    
    
    
    
    // Mark: - Helpers
    
    func highlightCells(indexPath: IndexPath) {
        if CardViewController.selectedIndexPath.indices.count == 0 {
            CardViewController.selectedIndexPath = indexPath
            let cell = collectionView?.cellForItem(at: indexPath)
            cell?.layer.borderWidth = 4.0
            cell?.layer.borderColor = UIColor.gray.cgColor
            //cell?.backgroundColor = UIColor.gray
            CardViewController.isSelected = true
        }
        else{
            if let oldCell = collectionView?.cellForItem(at: CardViewController.selectedIndexPath) {
                oldCell.layer.borderWidth = 4.0
                oldCell.layer.borderColor = UIColor.clear.cgColor
                //oldCell.backgroundColor = UIColor.clear
                //collectionView.reloadItems(at: [selectedIndexPath])
            }
            //print("old path", selectedIndexPath)
            //print("new path", indexPath)
            if(CardViewController.selectedIndexPath == indexPath && CardViewController.isSelected){
                CardViewController.isSelected = false
                print("card view is false")
            }
            else{
                let cell = collectionView?.cellForItem(at: indexPath)
                cell?.layer.borderWidth = 4.0
                cell?.layer.borderColor = UIColor.gray.cgColor
//                cell?.backgroundColor = UIColor.gray
                CardViewController.isSelected = true
                print(indexPath)
            }
            CardViewController.selectedIndexPath = indexPath
        }
    }
    



    func loadList(notification: Notification){
        print("caught notification")
//        self.collectionView?.reloadItems(at: (self.collectionView?.indexPathsForVisibleItems)!);
//        self.collectionView?.reloadData()
//        self.collectionView?.setNeedsDisplay()
        self.collectionView?.reloadData()
    }
    
    
    func update() {
        self.collectionView?.reloadData()
        
    }
    
    func removeCorrectanswer(_ flashcard: Flashcard){
    
        //remove flashcard from deck
        
        self.collectionView?.reloadData()
    }
    
    
    
}
