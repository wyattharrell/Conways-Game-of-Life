//
//  Cell.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/23/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation
import UIKit

enum State {
    case alive
    case dead
}

struct Cell {

    // MARK: - Properties
    var state: State
    let identifier: Int
    let x: Int
    let y: Int

    init(x: Int, y: Int, state: State, identifier: Int) {
        self.x = x
        self.y = y
        self.state = state
        self.identifier = identifier
    }

    // MARK: - Methods
    func isNeighbor(to cell: Cell) -> Bool {
        let xDelta = abs(self.x - cell.x)
        let yDelta = abs(self.y - cell.y)

        switch (xDelta, yDelta) {
        case (1, 1), (0, 1), (1, 0):
            return true
        default:
            return false
        }
    }
}
