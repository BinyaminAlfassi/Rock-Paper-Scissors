//
//  LetsPlayViewController.swift
//  Roshambo
//
//  Created by Binyamin Alfassi on 8/14/20.
//  Copyright © 2020 RBG Designs. All rights reserved.
//

import UIKit

class LetsPlayViewController: UIViewController {
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playRock(){
        
        //var resultsController: ShowResultsViewController
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let resultsController = storyboard.instantiateViewController(withIdentifier: "ShowResultsViewController") as! ShowResultsViewController
        resultsController.userChoise = .rock
        
        self.navigationController?.pushViewController(resultsController, animated: true)
    }
    
    @IBAction func playPaper(){
        performSegue(withIdentifier: "PlayPaperSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayPaperSegue"{
            let vc = segue.destination as! ShowResultsViewController
            vc.userChoise = .paper
        }
        else if segue.identifier == "ScissorsSegue"{
            let vc = segue.destination as! ShowResultsViewController
            vc.userChoise = .scissor
        }
        else if segue.identifier == "PlayRockSegue"{
            let vc = segue.destination as! ShowResultsViewController
            vc.userChoise = .rock
        }
        
        
    }


}

