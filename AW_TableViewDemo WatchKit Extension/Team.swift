//
//  Team.swift
//  AW_TableViewDemo
//
//  Created by Georgij on 27.01.17.
//  Copyright © 2017 Georgii Emeljanow. All rights reserved.
//

import Foundation

class Team {
    var members = [Member]()
    
    init() {
        let georguy = Member(withName: "Georguy", skills: "Swift & ObjC", post: "iOS")
        georguy.articles = ["iOS UI Testing", "Hello Apple Watch", "Layout with WatchKit", "Tables in WatchKit"]
        
        let alex = Member(withName: "Alex", skills: "Swift", post: "iOS")
        alex.articles = ["Segmented control на Swift", "Отладка в xCode", "Введение в Adobe XD", "Realm database"]
        
        let dmitrij = Member(withName: "Dmitrij", skills: "NodeJS", post: "back-end")
        dmitrij.articles = ["Mobile back-end: обзор технологий", "Применение Git в iOS-разработке ", "Простой back-end на Node.js", "Swift на сервере"]
        
        let albert = Member(withName: "Albert", skills: "Objective-C", post: "iOS")
        albert.articles = ["MVC", "AFNetworking", "Contacts"]
        
        members.append(georguy)
        members.append(alex)
        members.append(dmitrij)
        members.append(albert)
    }
}
