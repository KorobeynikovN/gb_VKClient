//
//  FriendFotoCollectionViewController.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 29.04.2021.
//

import UIKit

class FriendFotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    
    
    var dataFriends = [Friends] ()

    var friendsInfo = [String] ()
    var friendsFoto = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.collectionView!.register(FriendFotoCollectionViewCell.self, forCellWithReuseIdentifier: FriendFotoCollectionViewCell.reuseID)        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFriends.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendFotoCollectionViewCell.reuseID, for: indexPath) as! FriendFotoCollectionViewCell

        cell.configure(FriendName: dataFriends[indexPath.row].name, image: dataFriends[indexPath.row].photo, likeCount: indexPath.item+999)
        cell.likeControlTapped = { [weak self] likeCount in
            print(likeCount)
            //сделать сохранение лайков
            //self?.dataFriends[indexPath.item].photo.like = +-1
            //+проставить признак уже был лайк или нет
        }
        return cell
    }


}


//расставил Ид для коснтрейнтов чтобы отловить ошибку в случае конфликтов при создании вью
//отлдалил в итоге ошибку
//extension NSLayoutConstraint {
//
//    override public var description: String {
//        let id = identifier ?? ""
//        return "id: \(id), constant: \(constant)" //you may print whatever you want here
//    }
//}
