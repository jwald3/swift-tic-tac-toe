//
//  GameModel.swift
//  BeginnerTicTacToe
//
//  Created by Jordan Riesel on 7/3/23.
//

import Foundation

let gameBoardSize = 3

enum CellState {
    case empty
    case x
    case o
}

enum GameResult {
    case xWins
    case oWins
    case draw
    case ongoing
}


struct GameModel {
    var gameBoard: [[CellState]] = Array(repeating: Array(repeating: .empty, count: gameBoardSize), count: gameBoardSize)
    var isPlayerXTurn: Bool = true
    var gameOver: Bool = false
    
    mutating func makeMove(x: Int, y: Int) {
        if !gameOver {
            if gameBoard[x][y] == .empty {
                gameBoard[x][y] = isPlayerXTurn ? .x: .o
                isPlayerXTurn.toggle()
            }
        }
    }
    
    mutating func checkGameResult() -> GameResult {
        // win via rows
        for i in 0..<gameBoardSize {
            if gameBoard[i][0] == gameBoard[i][1] && gameBoard[i][1] == gameBoard[i][2] && gameBoard[i][0] != .empty {
                gameOver = true
                return gameBoard[i][0] == .x ? .xWins: .oWins
            }
        }
        
        // win via columns
        for i in 0..<gameBoardSize {
            if gameBoard[0][i] == gameBoard[1][i] && gameBoard[1][i] == gameBoard[2][i] && gameBoard[0][i] != .empty {
                gameOver = true
                return gameBoard[0][i] == .x ? .xWins: .oWins
            }
        }
        
        // win via diagonal
        if gameBoard[0][0] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[2][2] && gameBoard[0][0] != .empty {
            gameOver = true
            return gameBoard[0][0] == .x ? .xWins: .oWins
        }
        
        if gameBoard[2][0] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[0][2] && gameBoard[2][0] != .empty {
            gameOver = true
            return gameBoard[0][0] == .x ? .xWins: .oWins
        }
        
        // draw
        if !gameBoard.joined().contains(.empty) {
            gameOver = true
            return .draw
        }
        
        // if there are still empy cells, return .ongoing
        return .ongoing
    }
}










