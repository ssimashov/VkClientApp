//
//  FriendsViewController.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 23.11.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
   
    
    var friendsArray = [Friend]()
    
    let customCellReuseIdentifier = "customCellReuseIdentifier"
    let heightCustomTableViewCell:CGFloat = 150
    let toGallerySegue = "toCollectionViewSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
        tableview.dataSource = self
        tableview.delegate = self
        
        fillFriendsArray()
    
        
    }
    
}

extension FriendsViewController: UITableViewDataSource {
    
    func fillFriendsArray() {
        let friend1 = Friend(name: "Владимир Путин", avatar: "Putin", fotoArray: ["Putin1", "Putin2", "Putin3", "Putin4", "Putin5"])
        let friend2 = Friend(name: "Сергей Лавров", avatar: "Lavrov", fotoArray: ["Lavrov1", "Lavrov2", "Lavrov3", "Lavrov4", "Lavrov5"])
        let friend3 = Friend(name: "Владимир Жириновский", avatar: "Zhirik", fotoArray: ["Zhirik1", "Zhirik2", "Zhirik3", "Zhirik4", "Zhirik5"])
        let friend4 = Friend(name: "Дмитрий Медведев", avatar: "Medvedev", fotoArray: ["Medvedev1", "Medvedev2", "Medvedev3", "Medvedev4", "Medvedev5"])
        let friend5 = Friend(name: "Дональд Трамп", avatar: "Tramp", fotoArray: ["Tramp1", "Tramp2", "Tramp3", "Tramp4", "Tramp5"])
          
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray.append(friend4)
        friendsArray.append(friend5)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellReuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
    
        cell.configure(friend: friendsArray[indexPath.row])
        return cell
    }
     
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCustomTableViewCell
    }
    
    
}

extension FriendsViewController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toGallerySegue,
           let friendsFotoArray = sender as? [String],
           let destination = segue.destination as? GalleryViewController {
            destination.sourceArray = friendsFotoArray
        }
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let friendsFotoArray = friendsArray[indexPath.item].fotoArray {
            performSegue(withIdentifier: toGallerySegue, sender: friendsFotoArray)
        }
    }
    
}
