//
//  Coordinator.swift
//  opBuilder
//
//  Created by Guilherme Tavares Shimamoto on 06/05/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
