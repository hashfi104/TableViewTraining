//
//  ViewController.swift
//  AssesmentDay2
//
//  Created by Hashfi Alfian Ciyuda on 13/10/23.
//

import UIKit
import Alamofire

private let profileCell = "ProfileCell"

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataProfile = Profile(
        name: "Hashfi",
        job: "IOS Developer",
        age: 30,
        bio: "I'm an engineer. You can call me Hashfi or something that make you feel better"
    )
    
    let profileTypeOrder = [
        ProfileType.name,
        ProfileType.job,
        ProfileType.age,
        ProfileType.bio
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(
            UINib(
                nibName: "ProfileTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: profileCell
        )
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 216
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCell, for: indexPath) as! ProfileTableViewCell

        let cellData: [(ProfileType, String)] = [
            (profileTypeOrder[0], dataProfile.name),
            (profileTypeOrder[1], dataProfile.job),
            (profileTypeOrder[2], String(dataProfile.age)),
            (profileTypeOrder[3], dataProfile.bio)
        ]

        cell.setValue(
            type: cellData[indexPath.row].0,
            value: cellData[indexPath.row].1
        )
        return cell
    }
}
