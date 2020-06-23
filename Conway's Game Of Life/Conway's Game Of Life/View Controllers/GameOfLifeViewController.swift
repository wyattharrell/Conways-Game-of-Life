//
//  GameOfLifeViewController.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/23/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class GameOfLifeViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var gameBoard: GameBoard!
    @IBOutlet weak var rulesButton: UIButton!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        gameBoard.layer.cornerRadius = 8
        gameBoard.layer.shadowColor = UIColor.lightGray.cgColor
        gameBoard.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        gameBoard.layer.shadowRadius = 2.0
        gameBoard.layer.shadowOpacity = 0.5
        gameBoard.layer.masksToBounds = false
        gameBoard.clipsToBounds = false
        playButton.layer.cornerRadius = 8
        rulesButton.layer.cornerRadius = 15
    }

    // MARK: - IBActions
    @IBAction func playButtonTapped(_ sender: Any) {
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
