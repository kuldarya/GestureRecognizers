//
//  SwipeGestureViewController.swift
//  GestureRecognizers
//
//  Created by Darya Kuliashova on 21.01.21.
//

import UIKit

class SwipeGestureViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    private var imageList = [UIImage(named: "nature1"),
                            UIImage(named: "nature2"),
                            UIImage(named: "nature3"),
                            UIImage(named: "nature4"),
                            UIImage(named: "nature5")]
    
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Swipe Gesture"
        
        imageAppear()
        addSwipeGesture()
    }
    
    private func imageAppear() {
        if imageView.image == nil {
            imageView.image = imageList.randomElement() as? UIImage
        }
    }
    
    private func addSwipeGesture() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        leftSwipe.direction = .left
        imageView.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        rightSwipe.direction = .right
        imageView.addGestureRecognizer(rightSwipe)
    }
    
    @objc private func swipeGesture(sender: UISwipeGestureRecognizer?) {
        if let swipeGesture = sender {
            switch swipeGesture.direction {
            case .left:
                swipeToNextImage()
            case .right:
                swipeToPreviousImage()
            default:
                break
            }
        }
    }
    
    private func swipeToNextImage() {
        let nextImageView = UIImageView()
        nextImageView.frame = imageView.frame
        nextImageView.frame.origin.x = view.frame.width
        
        index += 1
        if index >= imageList.count {
            index = 0
        }
        
        nextImageView.image = imageList[index]
        
        nextImageView.contentMode = .scaleAspectFit
        nextImageView.clipsToBounds = true
        
        view.addSubview(nextImageView)
        
        UIView.animate(withDuration: 0.3, animations: {
            nextImageView.frame.origin.x = self.imageView.frame.origin.x
        }) { (_) in
            self.imageView.image = nextImageView.image
            nextImageView.removeFromSuperview()
        }
    }
    
    private func swipeToPreviousImage() {
        let previousImageView = UIImageView()
        previousImageView.frame = imageView.frame
        previousImageView.frame.origin.x = -imageView.frame.height
        
        index -= 1
        if index < 0 {
            index = imageList.count - 1
        }
        previousImageView.image = imageList[index]
        
        previousImageView.contentMode = .scaleAspectFit
        previousImageView.clipsToBounds = true
        
        view.addSubview(previousImageView)
        
        UIView.animate(withDuration: 0.3, animations: {
            previousImageView.frame.origin.x = self.imageView.frame.origin.x
        }) { (_) in
            self.imageView.image = previousImageView.image
            previousImageView.removeFromSuperview()
        }
    }
}
