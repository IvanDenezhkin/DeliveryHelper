//
//  MapViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 16.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    var bounds: GMSCoordinateBounds?
    var path: GMSPath?
    var markers: [GMSMarker]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        guard let markers = markers else { return }
        
        for marker in markers {
            marker.map = mapView
        }
        
        guard let path = path else { return }
        let polyline = GMSPolyline(path: path)
        polyline.map = mapView
        
        guard let position = bounds else { return }
        let update = GMSCameraUpdate.fit(position, withPadding: 50)
        mapView.moveCamera(update)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
