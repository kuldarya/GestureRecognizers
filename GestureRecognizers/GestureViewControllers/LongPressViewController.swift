//
//  LongPressViewController.swift
//  GestureRecognizers
//
//  Created by Darya Kuliashova on 22.01.21.
//

import UIKit
import MapKit

class LongPressViewController: UIViewController {
    @IBOutlet private weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NavigationTitle.longPress.rawValue

        addLongPress()
    }
    
    private func addLongPress() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(addAnotation(_:)))
        longPress.minimumPressDuration = 2.0
        mapView.addGestureRecognizer(longPress)
    }
    
    @objc private func addAnotation(_ gestureRecognizer: UILongPressGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }
        
        switch gestureRecognizer.state {
        case .began:
            let location = gestureRecognizer.location(in: mapView)
            let coordinates = mapView.convert(location, toCoordinateFrom: mapView)
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = coordinates
            annotation.title = "My favourite place"
            annotation.subtitle = "This is my favourite place"
            
            mapView.addAnnotation(annotation)
        default:
            break
        }
    }
}
