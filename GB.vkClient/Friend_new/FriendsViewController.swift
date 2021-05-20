//
//  FriendsViewController.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 20.05.2021.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var friendTableView: UITableView!
    @IBOutlet var letterControl: LetterControl!
    
    var data: [Friends] = [
        Friends(name:  "Владимир", fio: "Иванов", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "person.fill.turn.left")!),
        Friends(name:  "Юлиана", fio: "Петрова", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "pencil")!),
        Friends(name:  "Вероника", fio: "Андрееав", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart.fill")!),
        Friends(name:  "Григорий", fio: "Уваров", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "arkit")!),
        Friends(name:  "Евгений", fio: "Горбачев", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart")!),
        Friends(name:  "Иван", fio: "Артюгин", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "bolt")!),
        Friends(name:  "Владимир", fio: "Иванов", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "person.fill.turn.left")!),
        Friends(name:  "Юлиана", fio: "Петрова", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "pencil")!),
        Friends(name:  "Вероника", fio: "Андрееав", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart.fill")!),
        Friends(name:  "Григорий", fio: "Уваров", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "arkit")!),
        Friends(name:  "Евгений", fio: "Горбачев", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart")!),
        Friends(name:  "Иван", fio: "Артюгин", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "bolt")!),
        Friends(name:  "Владимир", fio: "Иванов", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "person.fill.turn.left")!),
        Friends(name:  "Юлиана", fio: "Петрова", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "pencil")!),
        Friends(name:  "Вероника", fio: "Андрееав", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart.fill")!),
        Friends(name:  "Григорий", fio: "Уваров", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "arkit")!),
        Friends(name:  "Евгений", fio: "Горбачев", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart")!),
        Friends(name:  "Иван", fio: "Артюгин", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "bolt")!),
        Friends(name:  "Владимир", fio: "Иванов", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "person.fill.turn.left")!),
        Friends(name:  "Юлиана", fio: "Петрова", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "pencil")!),
        Friends(name:  "Вероника", fio: "Андрееав", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart.fill")!),
        Friends(name:  "Григорий", fio: "Уваров", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "arkit")!),
        Friends(name:  "Евгений", fio: "Горбачев", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart")!),
        Friends(name:  "Иван", fio: "Артюгин", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "bolt")!),
        Friends(name:  "Владимир", fio: "Иванов", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "person.fill.turn.left")!),
        Friends(name:  "Юлиана", fio: "Петрова", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "pencil")!),
        Friends(name:  "Вероника", fio: "Андрееав", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart.fill")!),
        Friends(name:  "Григорий", fio: "Уваров", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "arkit")!),
        Friends(name:  "Евгений", fio: "Горбачев", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "heart")!),
        Friends(name:  "Иван", fio: "Артюгин", phone: Int.random(in: 100000..<999999), photo: UIImage(systemName: "bolt")!)
    ]
    
    //массив для БУКВ в контроле с навигацией по друзьям
    var dataPicker = [String] ()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        data.sort(by: { $0.fio < $1.fio} )
        dataPicker = Array(Set(data.compactMap( {  String($0.fio.first ?? "&") } ))).sorted()
        
        letterControl.letters = dataPicker
        letterControl.setupView()
        letterControl.addTarget(self, action: #selector(lettersControlUpdated), for: .valueChanged)
        //friendTableView.dataSource = self
        //friendTableView.delegate = self
        //
    }

    func letterListToFriend(_ letter: String) {
        guard let index = data.firstIndex(where: {(data) -> Bool in String(data.fio.first!) == letter})
            else {return}
        
        friendTableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
    }
    
    @objc func lettersControlUpdated() {
        guard let letterr = letterControl.selectLetter else {return}
        letterListToFriend(letterr)
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseIdentifier, for: indexPath) as! FriendsTableViewCell
        let name = data[indexPath.row].name
        let fio = data[indexPath.row].fio
        let img = data[indexPath.row].photo
        cell.configure(titleName: name, titleFIO: fio, image: img)
        return cell
        //UIImage(named: String) - для ассетсов названий
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goFriendFofo" {
//            guard let friendFotoCollectionVC : FriendFotoViewController = segue.destination as? FriendFotoViewController else {return}
//            guard let index = tableView.indexPathForSelectedRow else {return}
//
//            var selectFriend = [Friends] ()
//            selectFriend.append(data[index.row])
//            friendFotoCollectionVC.dataFriends = selectFriend
//        }
//
//      else {
//          return
//      }
//
//    }

}
