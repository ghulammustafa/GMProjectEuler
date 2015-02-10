//
//  Problem.swift
//  GMProjectEuler
//
//  Created by Mustafa on 22/01/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

import Foundation
import UIKit

class Problem: NSObject {
    var number: Int = 0
    var title: String = ""
    var detail: String = ""
    var reference: String = ""
    var status: String = ""
    var statusColor: UIColor?
    
    init(n: Int, t: String, d: String, r: String) {
        super.init()
        
        number = n
        title = t
        detail = d
        reference = r
        status = "grey"
        statusColor = UIColor.lightTintGreyColor()
    }

    init(n: Int, t: String, d: String, r: String, s: String) {
        super.init()
        
        number = n
        title = t
        detail = d
        reference = r
        status = s
        
        switch (status) {
        case "red":
            statusColor = UIColor.lightTintRedColor()
        case "green":
            statusColor = UIColor.lightTintGreenColor()
        case "blue":
            statusColor = UIColor.lightTintBlueColor()
        case "orange":
            statusColor = UIColor.lightTintOrangeColor()
        default:
            statusColor = UIColor.lightTintGreyColor()
        }
    }

    func description() -> String {
        return "number: \(number)\n" +
            "title: \(title)\n" +
            "detail: \(detail)\n" +
            "reference: \(reference)\n" +
            "status: \(status)"
    }
}