//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Danny  Yang on 10/16/16.
//  Copyright © 2016 Danny  Yang. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var time: String = ""
    var tasks: [String] = []
    var completed: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ToDoListTableViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    // Keeps track of time
    func updateTime() {
        time = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Delete cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.section)
            completed.remove(at: indexPath.section)
        }
        tableView.reloadData()
    }
    
    // Load cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        
        if tasks.count != 0 {
            cell.TaskName.text = tasks[indexPath.section]
        }
        
        return cell
    }
    
    // Mark cell as completed/incomplete
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completed[indexPath.section] = !completed[indexPath.section]
        let cell = tableView.cellForRow(at: indexPath)
        if completed[indexPath.section] {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
    }
    
    // MARK: Segue methods
    
    @IBAction func cancelTaskToAdd(segue: UIStoryboardSegue) {}
    
    @IBAction func addTaskToList(segue: UIStoryboardSegue) {
        if let prevVC = segue.source as? AddTaskViewcontroller {
            if let newTask = prevVC.taskName {
                if newTask != "" {
                    tasks.append(newTask)
                    completed.append(false)
                }
            }
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewStatistics" {
            if let nextVC = segue.destination as? UINavigationController {
                if let statVC = nextVC.topViewController as? StatisticsViewController {
                    statVC.completedTasks = completed.filter({$0 == true})
                }
            }
        }
    }
    // MARK: Timer methods
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
