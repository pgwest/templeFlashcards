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
    }
    
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
        //Fill in selected later
    }
    
    
}
