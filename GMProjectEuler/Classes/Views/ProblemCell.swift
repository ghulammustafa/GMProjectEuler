//
//  ProblemCell.swift
//  GMProjectEuler
//
//  Created by Mustafa on 16/01/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Delegate

protocol ProblemCellDelegate {
    func referenceButtonTapped(cell: ProblemCell)
}

// MARK: - Class

class ProblemCell : UITableViewCell {
    var delegate: ProblemCellDelegate?
    var maskApplied: Bool = false
    
    // MARK: - Properties
    
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var referenceButton: UIButton!
    @IBOutlet weak var carrotView: UIView!
    
    // MARK: - Actions

    @IBAction func referenceButtonTapped(sender: AnyObject) {
        delegate?.referenceButtonTapped(self)
    }

    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        // Apply rounded corner to the number's view/background
        numberView.layer.cornerRadius = numberView.frame.size.width / 2.0
        numberView.backgroundColor = UIColor.lightGrayColor()
        
        // Prepare carrot view
        var maskPath = CGPathCreateMutable()
        CGPathMoveToPoint(maskPath, nil, 0, 0)
        CGPathAddLineToPoint(maskPath, nil, 20, 0)
        CGPathAddLineToPoint(maskPath, nil, 20, 20)
        CGPathAddLineToPoint(maskPath, nil, 0, 0)

        var maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = carrotView.bounds
        maskLayer.path = maskPath;

        carrotView.layer.mask = maskLayer
    }
}