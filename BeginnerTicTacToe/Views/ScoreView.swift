//
//  ScoreView.swift
//  BeginnerTicTacToe
//
//  Created by Jordan Riesel on 7/4/23.
//

import SwiftUI

struct ScoreView: View {
    var player: String
    var score: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text(player)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(color)
            Text("\(score)")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(color)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(player: "Player 2", score: 0, color: Color.red)
    }
}
