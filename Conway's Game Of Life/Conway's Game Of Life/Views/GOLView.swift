//
//  GOLView.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/23/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class GOLView: UIView {

    // MARK: - Properties
    var gameBoard: GameBoard = GameBoard(size: 25)
    private var cellSize: Int = 15
    private var timer: Timer?

    convenience init(worldSize: Int, cellSize: Int) {
        let frame = CGRect(x: 0, y: 0, width: worldSize * cellSize, height: worldSize * cellSize)
        self.init(frame: frame)
        self.gameBoard = GameBoard(size: worldSize)
        self.cellSize = cellSize
    }

    convenience init() {
        let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        self.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()

        for cell in gameBoard.cells {
          let rect = CGRect(x: cell.x * cellSize, y: cell.y * cellSize, width: cellSize, height: cellSize)
            let color = cell.state == .alive ? UIColor.systemBlue.cgColor : UIColor.white.cgColor
            context?.addRect(rect)
            context?.setFillColor(color)
            context?.fill(rect)
        }
        context?.restoreGState()
    }

    func cellTapped(at index: Int) {
        gameBoard.cellTapped(at: index)
        setNeedsDisplay()
    }

    func clearBoard() {
        gameBoard.clearBoard()
        setNeedsDisplay()
    }

    func skipForward() {
        gameBoard.updateCells()
        setNeedsDisplay()
    }

    func showPresent(present: Int) {
        gameBoard.clearBoard()
        gameBoard.showPresent(present: present)
        setNeedsDisplay()
    }
    
    func startRunning() {
        timer = Timer.scheduledTimer(timeInterval: 0.2,
                                     target: self,
                                     selector: #selector(startUpdating),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func startUpdating() {
        self.gameBoard.updateCells()
        self.setNeedsDisplay()
    }
}
