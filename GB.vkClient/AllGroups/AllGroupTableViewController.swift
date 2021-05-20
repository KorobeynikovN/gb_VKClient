//
//  AllGroupTableViewController.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 29.04.2021.
//

import UIKit

class AllGroupTableViewController: UITableViewController {
    
    var AllGroups = ["Инвестиции", "Хай-тек", "GB", "Илон Маск", "Ауди.Россия", "Лучшие книги", "Новинки кино", "ФК Краснодар", "Путешествия","Новая музыка"]
    //AllGroupTableViewCell

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllGroups.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: FriendGroupTableViewCell.reuseIdentifier, for: indexPath) as! FriendGroupTableViewCell
        let groupName = AllGroups[indexPath.row]

        cell.configure(GroupName: groupName, image: UIImage(systemName: "bolt"))
        
        return cell
    }
   

}
