//
//  PinchViewController.swift
//  GestureRecognizers
//
//  Created by Darya Kuliashova on 21.01.21.
//

import UIKit

class PinchViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NavigationTitle.pinch.rawValue
        imageView.image = UIImage(named: "apple")
        
        addPinchGesture()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        imageView.removeFromSuperview()
    }
    
    private func addPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchImage(_:)))
        imageView.addGestureRecognizer(pinch)
    }
    
    @objc private func pinchImage(_ gestureRecognizer: UIPinchGestureRecognizer) {
        guard let gestureView = gestureRecognizer.view else { return }
        
        switch gestureRecognizer.state {
        case .began, .changed:
            gestureView.transform = (gestureView.transform.scaledBy(x: gestureRecognizer.scale,
                                                                    y: gestureRecognizer.scale))
            gestureRecognizer.scale = 1.0
        case .ended:
            break
        default:
            break
        }
    }
}
