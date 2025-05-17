//
//  Model.swift
//  Lesson5UIKIT
//
//  Created by Авазбек Надырбек уулу on 17.05.25.
//

import Foundation

struct TableItem {
    
    var image: String
    var text: String
    var secondText: String? = nil
     
    static func mockData() -> [TableItem] {
         [
            TableItem(image: "gear", text: "General"),
            TableItem(image: "person.badge.key", text: "Privary", secondText: "and Mele/Security"),
            TableItem(image: "lock.square", text: "Password", secondText: "And Key"),
            TableItem(image: "rosette", text: "Settings"),
         ]
    }
    
    static func mockData2() -> [TableItem] {
         [
            TableItem(image: "person.2.badge.gearshape", text: "General21"),
            TableItem(image: "calendar.day.timeline.left", text: "Privary", secondText: "and Mele/Security21"),
            TableItem(image: "lock.square", text: "Password", secondText: "And Key21"),
            TableItem(image: "rosette", text: "Settings21"),
         ]
    }
}



