//
//  GameBoard.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/23/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation

public class GameBoard {
    public var cells: [Cell] = []
    public let size: Int

    public init(size: Int) {
        self.size = size
        var id = 0
        for x in 0..<size {
            for y in 0..<size {
                let randomState = arc4random_uniform(3)
                let cell = Cell(x: x, y: y, state: randomState == 0 ? .alive : .dead, identifier: id)
                cells.append(cell)
                id += 1
            }
        }
    }

    func updateCells() {
        var updatedCells: [Cell] = []
        let liveCells = cells.filter { $0.state == .alive }
        var id = 0
        for cell in cells {
            let livingNeighbors = liveCells.filter { $0.isNeighbor(to: cell) }
            switch livingNeighbors.count {
            case 2...3 where cell.state == .alive:
                updatedCells.append(cell)
            case 3 where cell.state == .dead:
                let liveCell = Cell(x: cell.x, y: cell.y, state: .alive, identifier: id)
                updatedCells.append(liveCell)
            default:
                let deadCell = Cell(x: cell.x, y: cell.y, state: .dead, identifier: id)
                updatedCells.append(deadCell)
            }
            id += 1
        }

        cells = updatedCells
    }

    func cellTapped(at index: Int) {
        var cell = cells[index]
        print("Cell ID: \(cell.identifier)")
        if cell.state == .alive {
            cell.state = .dead
        } else {
            cell.state = .alive
        }
        cells[index] = cell
    }

    func clearBoard() {
        var id = 0
        var deadCells: [Cell] = []
        for x in 0..<size {
            for y in 0..<size {
                let cell = Cell(x: x, y: y, state: .dead, identifier: id)
                deadCells.append(cell)
                id += 1
            }
        }
        cells = deadCells
    }

    func showPresent(present: Int) {
        switch present {
        case 0:
            // Pulsar
            var cell = cells[310]
            cell.state = .alive
            cells[310] = cell

            cell = cells[314]
            cell.state = .alive
            cells[314] = cell

            for i in 360...364 {
                cell = cells[i]
                cell.state = .alive
                cells[i] = cell
            }

            for i in 260...264 {
                cell = cells[i]
                cell.state = .alive
                cells[i] = cell
            }
        case 1:
            var cell = cells[312]
            cell.state = .alive
            cells[312] = cell

            cell = cells[338]
            cell.state = .alive
            cells[338] = cell

            cell = cells[339]
            cell.state = .alive
            cells[339] = cell

            cell = cells[314]
            cell.state = .alive
            cells[314] = cell

            cell = cells[289]
            cell.state = .alive
            cells[289] = cell
        case 2:
            var cell = cells[264]
            cell.state = .alive
            cells[264] = cell

            cell = cells[262]
            cell.state = .alive
            cells[262] = cell

            cell = cells[286]
            cell.state = .alive
            cells[286] = cell

            cell = cells[311]
            cell.state = .alive
            cells[311] = cell

            cell = cells[336]
            cell.state = .alive
            cells[336] = cell

            cell = cells[361]
            cell.state = .alive
            cells[361] = cell

            cell = cells[362]
            cell.state = .alive
            cells[362] = cell

            cell = cells[363]
            cell.state = .alive
            cells[363] = cell

            cell = cells[339]
            cell.state = .alive
            cells[339] = cell
        case 3:
            for i in 0...24 {
                var cell = cells[i]
                cell.state = .alive
                cells[i] = cell
            }

            for i in 600...624 {
                var cell = cells[i]
                cell.state = .alive
                cells[i] = cell
            }

            var i = 0

            while i != 600 {
                var cell = cells[i]
                cell.state = .alive
                cells[i] = cell
                i += 25
            }

            i = 24

            while i != 624 {
                var cell = cells[i]
                cell.state = .alive
                cells[i] = cell
                i += 25
            }
        default:
            print("Error showing library present")
        }

    }
}
