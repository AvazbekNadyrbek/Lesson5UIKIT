//
//  ModelForHomeWork.swift
//  Lesson5UIKIT
//
//  Created by Авазбек Надырбек уулу on 19.05.25.
//

import Foundation

struct ModelForHomeWork {
    var nameOfTabel: String
    var subTitle: String? = nil
    var image: String
    
    static func getAllData() -> [ModelForHomeWork] {
        [
            ModelForHomeWork(nameOfTabel: "User1", image: "omgHW5"),
            ModelForHomeWork(nameOfTabel: "User2", image: "omgHW5"),
            ModelForHomeWork(nameOfTabel: "User3", image: "omgHW5"),
            ModelForHomeWork(nameOfTabel: "User4", image: "omgHW5"),
        ]
    }
    
    static func getAllDataWithSubTitle() -> [ModelForHomeWork] {
        [
            ModelForHomeWork(nameOfTabel: "Group 1", subTitle: "some text", image: "omgHW5"),
            ModelForHomeWork(nameOfTabel: "Group 2", subTitle: "some text", image: "omgHW5"),
            ModelForHomeWork(nameOfTabel: "Group 3", subTitle: "some text", image: "omgHW5"),
            ModelForHomeWork(nameOfTabel: "Group 4", subTitle: "some text", image: "omgHW5"),
        ]
    }
    
}
