//
//  Cell.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/23/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation
import UIKit

public enum State {
    case alive
    case dead
}

public struct Cell {
    public var state: State
    public let identifier: Int
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int, state: State, identifier: Int) {
        self.x = x
        self.y = y
        self.state = state
        self.identifier = identifier
    }

    public func isNeighbor(to cell: Cell) -> Bool {
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
