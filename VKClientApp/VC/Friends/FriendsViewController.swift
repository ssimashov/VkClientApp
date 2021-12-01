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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
        tableview.dataSource = self
        tableview.delegate = self
        
        fillFriendsArray()
    
        
    }
    
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func fillFriendsArray() {
        let friend1 = Friend(name: "Lavrov", avatar: "1", fotoArray: ["2"])
        let friend2 = Friend(name: "Putin", avatar: "3", fotoArray: ["4"])
        friendsArray.append(friend1)
        friendsArray.append(friend2)
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
