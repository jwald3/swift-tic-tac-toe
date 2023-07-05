//
//  CellView.swift
//  BeginnerTicTacToe
//
//  Created by Jordan Riesel on 7/3/23.
//

import SwiftUI

struct CellView: View {
    var state: CellState
    var x: Int
    var y: Int
    
    var cellColor: Color {
        switch state {
        case .empty:
            return Color.white
        case .x:
            return Color.pink.opacity(0.8)
        case .o:
            return Color.green.opacity(0.8)
        }
    }
    
    var cellText: String {
        switch state {
        case .x:
            return "X"
        case .o:
            return "O"
        case .empty:
            return ""
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(cellColor)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .aspectRatio(1, contentMode: .fit)
                
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
            Text(cellText)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .padding(1.0)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(state: .o, x: 0, y: 0)
    }
}
