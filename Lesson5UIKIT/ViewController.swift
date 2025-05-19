//
//  ViewController.swift
//  Lesson5UIKIT
//
//  Created by Авазбек Надырбек уулу on 17.05.25.
//

import UIKit

// Struct

class Item {
    // в static мы обычно что то храним, для того чтобы быстро получить данные 
    static let id: Int = 12323
    var name: String = ""
    var age: Int = 0
    
}

class ViewController: UIViewController {
    

    // Суть таблицы это визуальное представление какое-то массива
    
    // 1 Нужны данные которые нужно вывести
//    lazy var names: [String] = ["name1","name2", "name3", "name 4", "name5", "name6", "name7", "name8", "name9", "name10", "name11", "name12","name13"]
    
    var tableData = TableItem.mockData()
    
    var tableData2 = TableItem.mockData2()
    
    //  2 Создать таблицы
    lazy var tabelView: UITableView = {
        
        // 4 Обращение внутри самого класса который подписан под этот прокотокол
        $0.dataSource = self
        // 5 MARK: regist Cell UITableViewCell
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        $0.delegate = self
         
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabelView)
        
    }
    
}

// UITableVieController protocol extention

extension ViewController: UITableViewDataSource {
    
    // 3 Create a data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // сколько ячеек мы хотим в таблице -  сколько сколько у нас данных
        if section == 1 {
            return tableData.count
        } else {
            return tableData2.count
        }
    }
    // Настройка конктреткной таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 6 MARK: we have to return one Cell a view
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
       
        var config = cell.defaultContentConfiguration()

        var localArray: [TableItem] = []
        
//        if indexPath.section == 0 {
//            localArray = tableData
//        } else {
//            localArray = tableData2
//        }
        
        switch indexPath.section {
            case 0: localArray = tableData
            default: localArray = tableData2
        }
        
        config.text = localArray[indexPath.row].text
        config.image = UIImage(systemName: localArray[indexPath.row].image)
        config.secondaryText = localArray[indexPath.row].secondText
        cell.contentConfiguration = config
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0: return "Section 1"
        default: return "Section 2"
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Section 1 HEADER"
        default: return "Section HEADER"
        }
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let item = tableData[indexPath.row].text
            print(item)
        default:
            let item = tableData2[indexPath.row].text
            print(item)
        }
    }
}

#Preview {
    ViewController()
}
