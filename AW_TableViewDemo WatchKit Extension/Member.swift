//
//  Member.swift
//  AW_TableViewDemo
//
//  Created by Georgij on 25.01.17.
//  Copyright © 2017 Georgii Emeljanow. All rights reserved.
//

import Foundation

class Member {
    var name: String!
    var skills: String!
    var articles: [String]?
    var post: String!
    
    init() {}
    
    init(withName name: String, skills: String, post: String) {
        self.name = name
        self.skills = skills
        self.post = post
    }
}
