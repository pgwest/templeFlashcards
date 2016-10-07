//
//  CardViewController.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/4/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class CardViewController: UICollectionViewController {
    
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
        
    }
    
    
    
    
    // Mark: - Helpers
    
    


    func loadList(notification: Notification){
        print("caught notification")
//        self.collectionView?.reloadItems(at: (self.collectionView?.indexPathsForVisibleItems)!);

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
