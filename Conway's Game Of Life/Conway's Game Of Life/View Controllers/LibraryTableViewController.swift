//
//  LibraryTableViewController.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/24/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath)

        cell.textLabel?.text = "Testing"

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        dismiss(animated: true, completion: nil)
    }
}
