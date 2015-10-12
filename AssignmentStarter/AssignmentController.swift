//
//  AssignmentController.swift
//
//
//  Created by Jeremiah Jessel on 5/27/15.
//
//

import UIKit
import CoreData

class AssignmentController: UITableViewController {
  
  var assignments = [Assignment]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - IBAction
  
  // MARK: - TableView Data Source
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return assignments.count
  }
  
  // MARK: - Data
  
  func fetchResults(){
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let moc = appDelegate.managedObjectContext!
    
    let fetchRequest = NSFetchRequest(entityName: "Assignment")
    
    do  {
    let fetchedResults = try moc.executeFetchRequest(fetchRequest, error: &error) as! [Assignment] {
      assignments = fetchedResults
      tableView.reloadData()
      println(assignments.count)
    } catch {
      print("Could not retrieve any results \(error)")
    }
  }
  
  
  
}
