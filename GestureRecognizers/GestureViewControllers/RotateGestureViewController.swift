//
//  RotateGestureViewController.swift
//  GestureRecognizers
//
//  Created by Darya Kuliashova on 22.01.21.
//

import UIKit

enum NavigationTitle: String {
    case pan = "Pan Gesture"
    case swipe = "Swipe Gesture"
    case pinch = "Pinch Gesture"
    case rotate = "Rotate Gesture"
}

class RotateGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NavigationTitle.rotate.rawValue

    }

}
