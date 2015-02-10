//
//  MasterViewController.swift
//  GMProjectEuler
//
//  Created by Mustafa on 15/01/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var objects = Array<Problem>()

    // MARK: - View lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the table for dynamic sizing cells
        tableView.estimatedRowHeight = 85.0
        tableView.rowHeight = UITableViewAutomaticDimension

        self.objects = ProjectEulerProblemsManager.sharedManager.problems
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "showDetail" {
            //
            //            if let indexPath = self.tableView.indexPathForSelectedRow() {
            //                let object = objects[indexPath.row] as NSDate
            //            (segue.destinationViewController as DetailViewController).detailItem = object
            //            }
        }
    }
}

// MARK: - UITableViewDataSource extension

extension MasterViewController: UITableViewDataSource {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProblemCell", forIndexPath: indexPath) as ProblemCell

        cell.delegate = self
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        // Configure cell
        let p: Problem = self.objects[indexPath.row]
        cell.numberLabel.text = String(p.number)
        cell.titleLabel.text = p.title
        cell.detailLabel.text = p.detail
        
        // Developer's Note:
        // The following line resolves an annoying issue where the cell height appears to be incorrect and labels don't wrap text correctly.
        // Scrolling the table, or rotating the device fixes the issue.
        cell.layoutIfNeeded()
        
        return cell
    }
}

// MARK: - UITableViewDelegate extension

extension MasterViewController: UITableViewDelegate {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(__FUNCTION__): Tapped on index \(indexPath.row)")
        let p: Problem = self.objects[indexPath.row]
        
        let result: String? = ProjectEulerProblemsManager.sharedManager.solveProblem(p)
        
        if result != nil {
            let alertController = UIAlertController(title: "Result", message: result, preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // Do nothing
            }
            
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // Do nothing
            }
        }
    }
}

// MARK: - ProblemCellDelegate extension

extension MasterViewController: ProblemCellDelegate {
    
    func referenceButtonTapped(cell: ProblemCell) {
        println("\(__FUNCTION__): Tapped on cell \(cell)")
        var indexPath: NSIndexPath = self.tableView.indexPathForCell(cell)!
        let index = indexPath.row
        let p: Problem = self.objects[indexPath.row]
        let referenceURLString: String = p.reference

        // Open reference page
        UIApplication.sharedApplication().openURL(NSURL(string: referenceURLString)!)
    }
}

