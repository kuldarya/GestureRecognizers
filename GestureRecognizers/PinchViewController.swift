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
        
        navigationItem.title = "Pinch Gesture"
        imageView.image = UIImage(named: "apple")
        
        addPinchGesture()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        imageView.removeFromSuperview()
    }
    
    private func addPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchImage(sender:)))
        imageView.addGestureRecognizer(pinch)
    }
    
    @objc private func pinchImage(sender: UIPinchGestureRecognizer) {
        guard let gestureView = sender.view else {
            return
        }
        
        gestureView.transform = gestureView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
}
