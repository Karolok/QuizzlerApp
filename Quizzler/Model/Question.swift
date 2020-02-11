//
//  Question.swift
//  Quizzler
//
//  Created by Karol Bryzgiel on 11/02/2020.
//  Copyright © 2020 Karol Bryzgiel. All rights reserved.
//

import Foundation

struct Question {
    var name: String
    var answers: [String]
    var correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        name = q
        answers = a
        correct = correctAnswer
    }
    
}
