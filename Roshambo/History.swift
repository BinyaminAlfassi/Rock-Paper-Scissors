//
//  History.swift
//  Roshambo
//
//  Created by Binyamin Alfassi on 8/23/20.
//  Copyright © 2020 RBG Designs. All rights reserved.
//

import Foundation



class History {
    static var history: [HistoryRecord] = []
    
    static func addToHistory(result: ShowResultsViewController.gameResults, user: ShowResultsViewController.handChoices, opponent: ShowResultsViewController.handChoices) {
        history.append(HistoryRecord(resault: result, user: user, opponent: opponent))
    }
}


struct HistoryRecord {
    var resault: ShowResultsViewController.gameResults
    var user: ShowResultsViewController.handChoices
    var opponent: ShowResultsViewController.handChoices
}
