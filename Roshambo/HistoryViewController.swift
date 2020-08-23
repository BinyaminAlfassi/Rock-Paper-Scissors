//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Binyamin Alfassi on 8/23/20.
//  Copyright © 2020 RBG Designs. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let historyDataIdentifier = "HistoryDataIdentifier"
    
    let tableCellsColors: [ShowResultsViewController.gameResults : UIColor] = [.win: UIColor.green, .lose: UIColor.red, .tie: UIColor.white]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return History.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.historyDataIdentifier)!
        
        let gameRecord = History.history[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = gameRecord.resault.rawValue.uppercased()
        cell.detailTextLabel?.text = "User: \(gameRecord.user) VS Opponent: \(gameRecord.opponent)"
        cell.backgroundColor = self.tableCellsColors[gameRecord.resault]
        if gameRecord.resault == .tie {
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.textColor = UIColor.black
        }
        
        return cell
    }
    
    @IBAction func doneButton(){
        self.dismiss(animated: true, completion: nil)
    }

}
