//
//  PanGestureViewController.swift
//  GestureRecognizers
//
//  Created by Darya Kuliashova on 21.01.21.
//

import UIKit

class PanGestureViewController: UIViewController {
    @IBOutlet private weak var fileImageView: UIImageView!
    @IBOutlet private weak var trashImageView: UIImageView!
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileImageView.image = UIImage(named: "file")
        trashImageView.image = UIImage(named: "trashFull")
        navigationItem.title = NavigationTitle.pan.rawValue
        
        addPanGesture(view: fileImageView)
        fileViewOrigin = fileImageView.frame.origin
        view.bringSubviewToFront(fileImageView)
    }
    
    private func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc private func handlePan(sender: UIPanGestureRecognizer) {
        guard let fileView = sender.view else { return }
        
        switch sender.state {
        case .began, .changed:
            moveViewWithPan(view: fileView, sender: sender)
        case .ended:
            if fileView.frame.intersects(trashImageView.frame) {
                deleteView(view: fileView)
            } else {
                returnViewToOrigin(view: fileView)
            }
        default:
            break
        }
    }
    
    private func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    private func returnViewToOrigin(view: UIView) {
        UIView.animate(withDuration: 0.3) {
            view.frame.origin = self.fileViewOrigin
        }
    }
    
    private func deleteView(view: UIView) {
        UIView.animate(withDuration: 0.3) {
            view.alpha = 0.0
        }
    }
}
