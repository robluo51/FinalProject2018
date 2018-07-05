//
//  ResultTableViewController.swift
//  FinalProject2018
//
//  Created by PeterChen on 2018/7/5.
//  Copyright © 2018年 User02. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {
    let api: String = "https://worldcup.sfg.io/matches"
    var matchResults: [MatchResult]?
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        getFIFAData()
        tableView.estimatedRowHeight = 110
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getFIFAData() {
        API().getAPIData(API: api) { (data) in
            do {
                let apiData = try Decode().getFIFAData(jsonData: data)
                DispatchQueue.main.async {
                    self.matchResults = apiData.results
                    if self.matchResults != nil {
                        self.tableView.reloadData()
                    }
                }
                
            } catch {
                print("Get FIFA data error")
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return matchResults?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchListCell", for: indexPath) as! ResultTableViewCell
        
        cell.homeNameLabel.text = matchResults?[indexPath.row].homeTeam.country
        cell.awayNameLabel.text = matchResults?[indexPath.row].awayTeam.country
        if matchResults != nil {
            cell.awayGoalLabel.text = String((matchResults?[indexPath.row].awayTeam.goals)!)
            cell.homeGoalLabel.text = String((matchResults?[indexPath.row].homeTeam.goals)!)
            
            print("Date: \(matchResults?[indexPath.row].dateTime)")
            let date = dateFormatter.date(from: (matchResults?[indexPath.row].dateTime)!)
            //            dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
            //            let dateToString: String = dateFormatter.string(from: date!)
            print(date)
            cell.timeLabel.text = matchResults?[indexPath.row].dateTime
        }
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showMatchDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let row = sender as! Int
        print("selected Row: \(row)")
        print(matchResults?[row].homeTeam)
        let controller = segue.destination as? ResultDetailViewController
        controller?.homeTeam = matchResults?[row].homeTeam.country
        controller?.awayTeam = matchResults?[row].awayTeam.country
        controller?.homeTeamEvents = matchResults?[row].homeTeamEvents
        controller?.awayTeamEvents = matchResults?[row].awayTeamEvents
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
