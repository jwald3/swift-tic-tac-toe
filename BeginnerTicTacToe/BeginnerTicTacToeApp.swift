//
//  BeginnerTicTacToeApp.swift
//  BeginnerTicTacToe
//
//  Created by Jordan Riesel on 7/3/23.
//

import SwiftUI

@main
struct BeginnerTicTacToeApp: App {
    @ObservedObject var viewModel: GameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: viewModel)
        }
    }
}
