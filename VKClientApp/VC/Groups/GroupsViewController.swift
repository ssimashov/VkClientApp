//
//  GroupsViewController.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 24.11.2021.
//

import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sourceArray = ["group test"]
    
    let customCellReuseIdentifier = "customCellReuseIdentifier"
    let heightCustomTableViewCell:CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
    }
}

extension GroupsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellReuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
    
        cell.configure(image: nil, text: sourceArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCustomTableViewCell
    }
    
}
