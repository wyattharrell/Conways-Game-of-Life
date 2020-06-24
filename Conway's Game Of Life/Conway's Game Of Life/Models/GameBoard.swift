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
}
