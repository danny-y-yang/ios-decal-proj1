//
//  AddTaskViewcontroller.swift
//  ToDoList
//
//  Created by Danny  Yang on 10/16/16.
//  Copyright © 2016 Danny  Yang. All rights reserved.
//

import UIKit

class AddTaskViewcontroller: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var taskText: UITextField!
    var taskName: String?
    
    var limitLength = 35
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length + range.location > (taskText.text?.characters.count)! {
            return false
        }
        
        
        let newLength = (taskText.text?.characters.count)! + string.characters.count - range.length
        return newLength <= limitLength
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        taskName = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTaskCompleted" {
            taskName = taskText.text
        }
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
