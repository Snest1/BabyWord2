//
//  Interest.swift
//  Interests
//
//  Created by Duc Tran on 6/13/15.
//  Copyright © 2015 Developer Inspirus. All rights reserved.
//

import UIKit



class Answer
{
    var text = ""
    var image: UIImage
    var fontcolor: UIColor
    
    init(text: String, image: UIImage, fontcolor: UIColor)
    {
        self.text = text
        self.image = image
        self.fontcolor = fontcolor
    }
    
    static func fetchAnswers() -> [Answer]
    {
        var  answerSet: [Answer] = []
        
        answerSet.removeAll()
        
        Datas.Words.set.shuffle()
        let randomInt = Int.random(in: 0..<Datas.Words.set.count-1)
        Datas.Words.RealAnswerIs.eng = Datas.Words.set[randomInt].eng
        Datas.Words.RealAnswerIs.rus = Datas.Words.set[randomInt].rus
        answerSet.append(Answer(text: Datas.Words.set[randomInt].rus, image: UIImage(named: Datas.Words.set[randomInt].image)!, fontcolor: Datas.Words.set[randomInt].fontcolor))
        print("Сброс на RUS=\(Datas.Words.RealAnswerIs.eng), ENG=\(Datas.Words.RealAnswerIs.rus)")

        
        
        for _ in 0...8 {
            let randomInt = Int.random(in: 0..<Datas.Words.set.count-1)
            print("try add RUS=\(Datas.Words.set[randomInt].rus), ENG=\(Datas.Words.set[randomInt].eng)")

            answerSet.append(Answer(text: Datas.Words.set[randomInt].rus, image: UIImage(named: Datas.Words.set[randomInt].image)!, fontcolor: Datas.Words.set[randomInt].fontcolor))
        }
        answerSet.shuffle()

        return answerSet

    }
}
