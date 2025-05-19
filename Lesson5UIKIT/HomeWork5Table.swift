//
//  HomeWork5Table.swift
//  Lesson5UIKIT
//
//  Created by Авазбек Надырбек уулу on 19.05.25.
//

import UIKit

class HomeWork5Table: UIViewController {
    
    var dataTable1 = ModelForHomeWork.getAllData()
    var dataTable2 = ModelForHomeWork.getAllDataWithSubTitle()
    
    private lazy var tableView: UITableView = {
        // 4 Обращение внутри самого класса который подписан под этот прокотокол
        $0.dataSource = self
        // 5 MARK: regist Cell UITableViewCell
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        $0.delegate = self
         
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataTable1)
        view.addSubview(tableView)
    }

}

extension HomeWork5Table: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // how much cell do we need
        if section == 1 {
            return dataTable1.count
        } else {
            return dataTable2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        
        var localArray: [ModelForHomeWork] = []
        
        switch indexPath.section {
            case 0: localArray = dataTable1
            default: localArray = dataTable2
        }
        
        config.text = localArray[indexPath.row].nameOfTabel
        
        let image = UIImage(named: localArray[indexPath.row].image)
        config.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        config.imageProperties.cornerRadius = 5
        config.image = image
        
        config.secondaryText = localArray[indexPath.row].subTitle
        
        cell.contentConfiguration = config
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "USERS"
        default : return "GROUPS"
        }
    }
}

extension HomeWork5Table: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let item = dataTable1[indexPath.row].nameOfTabel
            print(item)
        default:
            let item = dataTable2[indexPath.row].nameOfTabel
            print(item)
        }
    }
}

#Preview {
    HomeWork5Table()
}
