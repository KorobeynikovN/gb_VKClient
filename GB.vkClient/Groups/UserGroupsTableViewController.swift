//
//  UserGroupsTableViewController.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 29.04.2021.
//

import UIKit

class UserGroupsTableViewController: UITableViewController {
    var Groups = ["Инвестиции", "Хай-тек", "GB", "Илон Маск", "Ауди.Россия"]
    
    var dataGroups: [Friends] = [
        Friends(name:  "Инвестиции", fio: "", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "person.fill.turn.left")!),
        Friends(name:  "Хай-тек", fio: "", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "pencil")!),
        Friends(name:  "GB", fio: "", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart.fill")!),
        Friends(name:  "Илон Маск", fio: "", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "arkit")!),
        Friends(name:  "Ауди.Россия", fio: "", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //добавляем группу по нажатию группы на форме со всеми группами
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
    guard segue.identifier == "addGroup",
          let sourceController = segue.source as? AllGroupTableViewController,
          let index = sourceController.tableView.indexPathForSelectedRow
        
        else {
            return
        }
             
        let newGroup = sourceController.AllGroups[index.row]
        // Добавляем город в список выбранных городов
        if dataGroups.contains(where: {$0.name == newGroup}) {
            print("дубликат  \(newGroup)")
        }
        if !Groups.contains(newGroup) {
            Groups.append(newGroup)
        }
        // Обновляем таблицу
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendGroupTableViewCell.reuseIdentifier, for: indexPath) as! FriendGroupTableViewCell

        let groupName = Groups[indexPath.row]
        cell.configure(GroupName: groupName, image: UIImage(systemName: "bolt"))
        
        return cell
    }
    

}
