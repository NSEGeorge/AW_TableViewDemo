//
//  InterfaceController.swift
//  AW_TableViewDemo WatchKit Extension
//
//  Created by Georgij on 25.01.17.
//  Copyright © 2017 Georgii Emeljanow. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    let team = Team()
    var map: [String: [Member]]!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
 
        map = [String: [Member]]()
        
        for member in team.members {
            var arr = map[member.post] ?? [Member]()
            arr.append(member)
            map[member.post] = arr
        }
        
        for (post, members) in map {
            addRow(withType: post, members: members)
        }
    }
    
    func addRow(withType type: String, members: [Member]) {
        let rows = table.numberOfRows
        
        table.insertRows(at: NSIndexSet(index: rows) as IndexSet, withRowType: "TeamHeaderType")
        
        let itemRows = NSIndexSet(indexesIn: NSRange(location: rows + 1, length: members.count))
        table.insertRows(at: itemRows as IndexSet, withRowType: "MemberRowType")
        
        for i in rows..<table.numberOfRows {
            let controller = table.rowController(at: i)
            
            if let controller = controller as? TeamHeaderController {
                controller.image.setImageNamed(type)
                controller.label.setText(type)
            } else if let controller = controller as? MemberRowController {
                let member = members[i - rows - 1]
                controller.type = type
                controller.nameLbl.setText(member.name)
                controller.skillsLbl.setText(member.skills)
            }
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String,
                                  in table: WKInterfaceTable,
                                  rowIndex: Int) -> Any? {
        
        let arr = Array(map.flatMap{[$0.1]}.joined(separator: [Member()]))
        return arr[rowIndex - 1]
    }
}
