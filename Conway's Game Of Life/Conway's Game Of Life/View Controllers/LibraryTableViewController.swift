//
//  LibraryTableViewController.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/24/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

protocol PresetSelectedDelegate: AnyObject {
    func displayPreset(for present: Int)
}

enum PresetLibrary: Int {
    case pulsar
}

class LibraryTableViewController: UITableViewController {

    // MARK: - Properties
    private let library: [String] = ["Pulsar"]
    weak var delegate: PresetSelectedDelegate?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath)

        cell.textLabel?.text = library[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        dismiss(animated: true) {
            self.delegate?.displayPreset(for: indexPath.row)
        }
    }
}
