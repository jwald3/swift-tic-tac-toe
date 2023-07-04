//
//  GameView.swift
//  BeginnerTicTacToe
//
//  Created by Jordan Riesel on 7/3/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Tic Tac Toe")
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(Color.blue.opacity(0.7))
            Spacer()
            VStack {
                ForEach(0..<3) { i in
                    HStack {
                        ForEach(0..<3){ j in
                            CellView(state: viewModel.gameBoard[i][j], x: i, y: j)
                                .onTapGesture {
                                    viewModel.makeMove(x: i, y: j)
                                }
                        }
                    }
                }
            }
            Spacer()
            
            if viewModel.gameOver {
                Text(viewModel.winMessage)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.red)
                Spacer()
            }
            
            HStack {
                Spacer()
                ScoreView(player: "Player 1", score: viewModel.playerXScore,
                          color: .pink)
                Spacer()
                ScoreView(player: "Player 2", score: viewModel.playerOScore, color: .green)
                Spacer()
            }
            Spacer()
            Button("Reset") {
                viewModel.resetGame()
            }
            .padding(.horizontal, 12.0)
            .padding(.vertical, 6.0)
            .background(Color.pink)
            .foregroundColor(.white)
            .font(.system(.headline, design: .rounded))
            .cornerRadius(12)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
        }
        .padding()
        .background(Color.blue.opacity(0.2).edgesIgnoringSafeArea(.all))
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}
