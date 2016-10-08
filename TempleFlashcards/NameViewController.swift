//
//  NameViewController.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/4/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import UIKit

class NameViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let notificationName = Notification.Name("loadTable")
        NotificationCenter.default.addObserver(self, selector: #selector(NameViewController.updateFromView(notification:)), name: notificationName, object: nil)
        
    }
    
    static var selectedIndexPath = IndexPath()
    static var isSelected = false
    let TableNameCellIdentifier = "TempleNames"
    
    
    // Mark: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return CurrentFlashcardList.flashcardList.templeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TempleNameCell")!
        
        cell.textLabel?.text = CurrentFlashcardList.flashcardList.templeList[indexPath.row].name
        
        return cell
    }
    
    // Mark: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 //       tableView.reloadData()

        NameViewController.isSelected = true
        NameViewController.selectedIndexPath = indexPath
        //Fill in selected later
        if (CardViewController.isSelected){
            if(NameViewController.isSelected){
                if (CardViewController.selectedIndexPath.item == NameViewController.selectedIndexPath.item){
                    
                    print("correct")
                    
                    //Remove item and deselect
                    CurrentFlashcardList.flashcardList.templeList.remove(at: CardViewController.selectedIndexPath.item)
                    tableView.deselectRow(at: CardViewController.selectedIndexPath, animated: false)
                    
                    //Reset values
                    CardViewController.isSelected = false
                    NameViewController.isSelected = false
                    CardViewController.selectedIndexPath = IndexPath()
//                    print("selected index", NameViewController.selectedIndexPath)
                    NameViewController.selectedIndexPath = IndexPath()
                    
                    //Update the views
                    update()
                    let notificationName = Notification.Name("load")
                    NotificationCenter.default.post(name: notificationName, object: nil)
                    
                }
                else{
                    print("incorrect")
//                    print("Selected index", NameViewController.selectedIndexPath)
                }
            }
        }
       // tableView.reloadData()

    }
    
    func updateFromView(notification: Notification) {
        print("cauaght tableview update")
        tableView.deselectRow(at: NameViewController.selectedIndexPath, animated: false)
        NameViewController.selectedIndexPath = IndexPath()
        update()
        
    }
    
    func update(){
        tableView.reloadData()
    }
    

}
