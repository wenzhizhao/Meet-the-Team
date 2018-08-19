//
//  ViewController.swift
//  Meet the Team
//
//  Created by Wenzhi Zhao on 8/18/18.
//  Copyright © 2018 Wenzhi Zhao. All rights reserved.
//

import UIKit
import os

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static let fileName = "team"
    @IBOutlet weak var infoListTableView: UITableView!
    private var memberList = [TeamMember]()
    private var dataManager = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitialUI()
        if let list = dataManager.decodeJsonData(from: ViewController.fileName) {
            memberList = list
        }
    }
    
    private func setUpInitialUI() {
        infoListTableView.rowHeight = 88.0
        infoListTableView.tableFooterView = UIView()
        title = "Meet The Team"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let infoCell = tableView.dequeueReusableCell(withIdentifier: TeamMemberTableViewCell.identifier) as? TeamMemberTableViewCell else {
            return UITableViewCell()
        }
        infoCell.configureCell(memberList[indexPath.row])
        return infoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: DetailInfoViewController.identifier) as? DetailInfoViewController, let cell = tableView.cellForRow(at: indexPath) as? TeamMemberTableViewCell else {
            os_log("Cannot find DetailInfoViewController")
            return
        }
        vc.configure(with: memberList[indexPath.row], and: cell.profileImage)
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

