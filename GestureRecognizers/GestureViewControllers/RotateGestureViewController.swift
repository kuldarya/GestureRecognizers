//
//  RotateGestureViewController.swift
//  GestureRecognizers
//
//  Created by Darya Kuliashova on 22.01.21.
//

import UIKit

class RotateGestureViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NavigationTitle.rotate.rawValue
        imageView.image = UIImage(named: "apple")
        
        addRotateGesture()
    }
    
    private func addRotateGesture() {
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateImage(_:)))
        imageView.addGestureRecognizer(rotate)
    }
    
    @objc private func rotateImage(_ gestureRecognizer: UIRotationGestureRecognizer) {
        guard let gestureView = gestureRecognizer.view else { return }
        
        switch gestureRecognizer.state {
        case .began, .changed:
            gestureView.transform = gestureView.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        default:
            break
        }
    }
}
