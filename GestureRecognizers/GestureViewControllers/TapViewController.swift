//
//  TapViewController.swift
//  GestureRecognizers
//
//  Created by Darya Kuliashova on 22.01.21.
//

import UIKit

class TapViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var leadingImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageViewConstraint: NSLayoutConstraint!
    
    private let leadingConstraint = CGFloat(60)
    private let trailingConstraint = CGFloat(60)
    private let topConstraint = CGFloat(120)
    
    private var isZoomed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NavigationTitle.tap.rawValue
        imageView.image = UIImage(named: "bird")

        addTapGesture()
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapRecognized(_:)))
        imageView.addGestureRecognizer(tap)
    }
    
    @objc private func tapRecognized(_ gestureRecognizer: UITapGestureRecognizer) {
        if isZoomed {
            zoomOut()
        } else {
            zoomIn()
        }
        isZoomed = !isZoomed
    }

    private func zoomOut() {
        leadingImageViewConstraint.constant = leadingConstraint
        trailingImageViewConstraint.constant = trailingConstraint
        topImageViewConstraint.constant = topConstraint
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func zoomIn() {
        leadingImageViewConstraint.constant = 0
        trailingImageViewConstraint.constant = 0
        topImageViewConstraint.constant = CGFloat(topConstraint)
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
