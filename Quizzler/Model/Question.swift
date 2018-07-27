//
//  Question.swift
//  Quizzler
//
//  Created by Anuranjan Bose on 27/07/18.
//  Copyright © 2018 Anuranjan Bose. All rights reserved.
//

import Foundation


class Question {
    
    var questionText : String
    var answer : Bool
    
    init(text : String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
}
