//
//  Flashcard.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/4/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import Foundation

class Flashcard {
    
    // Mark: - Properties
    
    var fileName = ""
    var name = ""
    
    // Mark: - Initializer
    
    init(fileName: String,name: String) {
        self.fileName = fileName
        self.name = name
    }
}
