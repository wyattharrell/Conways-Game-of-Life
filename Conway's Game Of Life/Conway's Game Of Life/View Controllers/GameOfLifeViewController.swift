//
//  GameOfLifeViewController.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/23/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class GameOfLifeViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet var golView: GOLView!
    @IBOutlet weak var rulesButton: UIButton!

    // MARK: - Properties
    var isPlaying: Bool = false
    var buttons: [UIButton] = []

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupButtons()
    }

    // MARK: - Private Methods
    private func setupViews() {
        golView.layer.cornerRadius = 8
        golView.layer.shadowColor = UIColor.lightGray.cgColor
        golView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        golView.layer.shadowRadius = 2.0
        golView.layer.shadowOpacity = 0.5
        golView.layer.masksToBounds = false
        golView.clipsToBounds = false
        playButton.layer.cornerRadius = 8
        rulesButton.layer.cornerRadius = 15
    }

    private func setupButtons() {
        var leadingOffset: CGFloat = 0
        var topOffset: CGFloat = 0
        var identifier = 0

        for _ in 0..<25 {
            for _ in 0..<25 {

                let button = UIButton()
                button.backgroundColor = .clear
                button.tag = identifier
                golView.addSubview(button)
                button.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

                NSLayoutConstraint.activate([
                    button.topAnchor.constraint(equalTo: golView.topAnchor, constant: topOffset),
                    button.leadingAnchor.constraint(equalTo: golView.leadingAnchor, constant: leadingOffset),
                    button.heightAnchor.constraint(equalToConstant: 15),
                    button.widthAnchor.constraint(equalToConstant: 15)
                ])

                buttons.append(button)

                topOffset += 15
                identifier += 1

                if topOffset >= 375 {
                    topOffset = 0
                }
            }
            leadingOffset += 15
        }
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        //print("Button ID: \(sender.tag)")
        golView.cellTapped(at: sender.tag)
    }

    // MARK: - IBActions
    @IBAction func playButtonTapped(_ sender: Any) {
        isPlaying.toggle()
        playButton.isSelected = isPlaying

        if isPlaying {
            golView.startRunning()
        } else {
            golView.cancelTimer()
        }
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
