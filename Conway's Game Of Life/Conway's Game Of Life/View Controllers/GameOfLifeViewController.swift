//
//  GameOfLifeViewController.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/23/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class GameOfLifeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet var golView: GOLView!
    @IBOutlet weak var rulesButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var libraryButton: UIButton!
    @IBOutlet weak var generationLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!

    // MARK: - Properties
    var isPlaying: Bool = false
    var buttons: [UIButton] = []
    private var generationObserver: NSKeyValueObservation?
    private var populationObserver: NSKeyValueObservation?


    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupButtons()

        generationObserver = golView.gameBoard.observe(\.generation) { [weak self] object, change in
            self?.generationLabel.text = "Generation\n\(object.generation)"
        }

        populationObserver = golView.gameBoard.observe(\.population) { [weak self] object, change in
            self?.populationLabel.text = "Population\n\(object.population)"
        }
    }

    // MARK: - Private Methods
    private func setupViews() {
        clearButton.layer.cornerRadius = 8
        skipButton.layer.cornerRadius = 8
        playButton.layer.cornerRadius = 8
        libraryButton.layer.cornerRadius = 8
        rulesButton.layer.cornerRadius = 8
        golView.layer.shadowColor = UIColor.lightGray.cgColor
        golView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        golView.layer.shadowRadius = 2.0
        golView.layer.shadowOpacity = 0.5
        golView.layer.masksToBounds = false
        golView.clipsToBounds = false
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

    @IBAction func clearButtonTapped(_ sender: Any) {
        golView.clearBoard()
    }

    @IBAction func skipButtonTapped(_ sender: Any) {
        golView.skipForward()
    }

    @IBAction func unwindToGOL( _ seg: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LibraryModalSegue" {
            let destinationNavigationController = segue.destination as! UINavigationController
            guard let targetController = destinationNavigationController.topViewController as? LibraryTableViewController else { return }
            targetController.delegate = self
        }
    }
}

extension GameOfLifeViewController: PresetSelectedDelegate {
    func displayPreset(for present: Int) {
        golView.showPresent(present: present)
    }
}
