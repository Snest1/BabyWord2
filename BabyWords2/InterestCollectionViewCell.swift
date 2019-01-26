
//
//  InterestCollectionViewCell.swift
//  Interests
//
//  Created by Duc Tran on 3/6/17.
//  Copyright © 2017 Developer Inspirus. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    var answer: Answer? {
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI()
    {
        if let answer = answer {
            featuredImageView.image = answer.image
            interestTitleLabel.text = answer.text
            interestTitleLabel.textColor = answer.fontcolor
//          backgroundColorView.backgroundColor = answer.color
        } else {
            featuredImageView.image = nil
            interestTitleLabel.text = nil
            interestTitleLabel.textColor = nil
//          backgroundColorView.backgroundColor = nil
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
    }
    
}






















