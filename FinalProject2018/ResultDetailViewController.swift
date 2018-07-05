//
//  ResultDetailViewController.swift
//  FinalProject2018
//
//  Created by PeterChen on 2018/7/5.
//  Copyright © 2018年 User02. All rights reserved.
//

import UIKit

class ResultDetailViewController: UIViewController {
    @IBOutlet weak var homeNamelabel: UILabel!
    @IBOutlet weak var awayNameLabel: UILabel!
    var homeTeamEvents: [TeamEvents]?
    var awayTeamEvents: [TeamEvents]?
    var homeTeam: String?
    var awayTeam: String?
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var awayTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.awayTableView.delegate = self
        self.awayTableView.dataSource = self
        self.homeTableView.tag = 1
        self.awayTableView.tag = 2
        homeNamelabel.text = homeTeam ?? ""
        awayNameLabel.text = awayTeam ?? ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ResultDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 1:
            print("Home Event count: \(homeTeamEvents?.count)")
            return homeTeamEvents?.count ?? 0
        case 2:
            print("Away Event count: \(awayTeamEvents?.count)")
            return awayTeamEvents?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeEventCell", for: indexPath) as! HomeEventTableViewCell
            cell.timeLabel.text = homeTeamEvents?[indexPath.row].time
            cell.playerLabel.text = homeTeamEvents?[indexPath.row].player
            cell.eventLabel.text = homeTeamEvents?[indexPath.row].typeOfEvent
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "awayEventCell", for: indexPath) as! AwayEventTableViewCell
            cell.timeLabel.text = awayTeamEvents?[indexPath.row].time
            cell.playerLabel.text = awayTeamEvents?[indexPath.row].player
            cell.eventLabel.text = awayTeamEvents?[indexPath.row].typeOfEvent
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    
}














