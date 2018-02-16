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
}
