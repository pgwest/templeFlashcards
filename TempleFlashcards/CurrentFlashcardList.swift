//
//  CurrentFlashcardList.swift
//  TempleFlashcards
//
//  Created by Peter West on 10/4/16.
//  Copyright © 2016 Peter West. All rights reserved.
//

import Foundation

class CurrentFlashcardList {

    var currentScore = 0
    static var flashcardList = FlashcardList.permanentList
    
    func templeCount () -> Int {
        return CurrentFlashcardList.flashcardList.templeList.count
    }
    
    
    
    
    
    func removeCorrectanswer(_ flashcard: Flashcard){

        //remove flashcard from deck
        
    }

}
