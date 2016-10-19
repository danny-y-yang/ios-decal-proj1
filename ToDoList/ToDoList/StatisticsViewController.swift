//
//  StatisticsViewController.swift
//  ToDoList
//
//  Created by Danny  Yang on 10/16/16.
//  Copyright © 2016 Danny  Yang. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var completedTasks: [Bool] = []
    
    @IBOutlet weak var tasksCompleted: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksCompleted.text = String(describing: completedTasks.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
