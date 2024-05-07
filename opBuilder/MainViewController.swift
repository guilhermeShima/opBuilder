//
//  MainViewController.swift
//  opBuilder
//
//  Created by Guilherme Tavares Shimamoto on 06/05/24.
//

import UIKit
import SwiftUI

class MainViewController: UIHostingController<CardListSwiftUIView> {
    var viewModel: CardListViewModel
    
    init() {
        self.viewModel = CardListViewModel()
        super.init(rootView: CardListSwiftUIView(viewModel: viewModel))
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task.init {
            await viewModel.getCards()
        }
    }
}
