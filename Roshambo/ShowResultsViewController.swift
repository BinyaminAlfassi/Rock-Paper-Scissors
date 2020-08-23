//
//  ShowResultsViewController.swift
//  Roshambo
//
//  Created by Binyamin Alfassi on 8/14/20.
//  Copyright © 2020 RBG Designs. All rights reserved.
//

import UIKit

class ShowResultsViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel?
    @IBOutlet var resultImage: UIImageView!
    
    var userChoise: handChoices?
    var opponentHand: handChoices?
    
    enum handChoices: String, CaseIterable{
        case rock="Rock"
        case paper="Paper"
        case scissor="Scissors"
        
        static func randomizeHand() -> handChoices{
            return handChoices.allCases[Int(arc4random_uniform(UInt32(handChoices.allCases.count)))]
        }
    }
    
    enum gameResults: String {
        case tie = "tie"
        case win = "win"
        case lose = "lose"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.opponentHand = handChoices.randomizeHand()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let res = displayResult() as gameResults
        History.addToHistory(result: res, user: self.userChoise!, opponent: self.opponentHand!)
    }
    
    func RandHand(){
        
    }
    func displayResult() -> gameResults{
        var imageName: String
        var text: String
        let match = "\(userChoise!.rawValue) VS \(opponentHand!.rawValue)"
        
        let result: gameResults
        
        switch (userChoise!, opponentHand!) {
        case let (user, opponent) where user==opponent:
            text = "\(match): It's a tie!!!"
            imageName = "tie"
            result = .tie
        case (.rock, .scissor), (.paper, .rock
        ), (.scissor, .paper):
            text = "You win: \(match)!"
            imageName = "\(userChoise!.rawValue)\(opponentHand!.rawValue)"
            result = .win
        default:
            text = "You lose: \(match)"
            imageName = "\(opponentHand!.rawValue)\(userChoise!.rawValue)"
            result = .lose
        }
        
        resultLabel!.text = text
        //imageName = imageName.lowercased()
        let im = UIImage(named: imageName)
        resultImage!.image = im
        
        return result
    }
    
    @IBAction func donePlaying(){
        let _ = navigationController?.popToRootViewController(animated: true)
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
