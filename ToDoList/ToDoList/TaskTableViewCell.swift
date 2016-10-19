//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Danny  Yang on 10/16/16.
//  Copyright © 2016 Danny  Yang. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var TaskName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
