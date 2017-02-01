//
//  MemberDetailInterfaceController.swift
//  AW_TableViewDemo
//
//  Created by Georgij on 27.01.17.
//  Copyright © 2017 Georgii Emeljanow. All rights reserved.
//

import WatchKit
import Foundation


class MemberDetailInterfaceController: WKInterfaceController {
    
    @IBOutlet var table: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let member = context as? Member {
            let rowTypes: [String] = ["MemberHeaderType"] + member.articles!.map({ _ in
                "MemberArticleType"
            })
            table.setRowTypes(rowTypes)
            for i in 0..<table.numberOfRows {
                let row = table.rowController(at: i)
                if let header = row as? MemberHeaderController {
                    header.nameLbl.setText(member.name)
                    
                } else if let article = row as? MemberArticleController {
                    article.articleLbl.setText("\(i). \(member.articles![i - 1])")
                }
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

}
