//
//  GOLView.swift
//  Conway's Game Of Life
//
//  Created by Wyatt Harrell on 6/23/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class GOLView: UIView {

    var gameBoard: GameBoard = GameBoard(size: 25)
    var cellSize: Int = 15
    var timer: Timer?

    public convenience init(worldSize: Int, cellSize: Int) {
        let frame = CGRect(x: 0, y: 0, width: worldSize * cellSize, height: worldSize * cellSize)
        self.init(frame: frame)
        self.gameBoard = GameBoard(size: worldSize)
        self.cellSize = cellSize
    }

    public convenience init() {
        let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        self.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public override func draw(_ rect: CGRect) {
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

    public func cellTapped(at index: Int) {
        gameBoard.cellTapped(at: index)
        setNeedsDisplay()
    }

}
