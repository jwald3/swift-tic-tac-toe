//
//  GameViewModel.swift
//  BeginnerTicTacToe
//
//  Created by Jordan Riesel on 7/3/23.
//
import Foundation

class GameViewModel: ObservableObject {
    @Published private var model: GameModel = GameModel()
    @Published var gameOver: Bool = false
    @Published var winMessage: String = ""
    @Published var playerXScore: Int = 0
    @Published var playerOScore: Int = 0
    
    
    var gameBoard: [[CellState]] {
        model.gameBoard;
    }
    
    func makeMove(x: Int, y: Int) {
        if !model.gameOver {
            model.makeMove(x: x, y: y)
            let gameResult = model.checkGameResult()
            
            switch gameResult {
            case .xWins:
                gameOver = true
                winMessage = "X wins"
                playerXScore += 1
            case .oWins:
                gameOver = true
                winMessage = "O wins"
                playerOScore += 1
            case .draw:
                gameOver = true
                winMessage = "Draw"
            case .ongoing:
                break
            }
        }
    }
    
    var gameResult: GameResult {
        model.checkGameResult()
    }
    
    func resetGame() {
        winMessage = ""
        model = GameModel()
    }
}
