//
//  NetworkManager.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 15.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps

class NetworkManager {
    static let basicURL = "https://maps.googleapis.com/maps/api/directions/json?"
    static let apiKey = "AIzaSyDoPDBCZdha7bxBn5kFdX8rt3Hx90ZR-rc"
    
    static func getRouse(withCoordinates coordinates: [CLLocationCoordinate2D], completion: @escaping(_ mapConfig: GMSCoordinateBounds?, _ path: GMSPath?, _ markers: [GMSMarker]?) -> ()) {
        let urlComponents = NSURLComponents(string: basicURL)!
        // first coordinates should be a start point
        // logic is that starting point is a destination point
        let startPoint = coordinates[0]
        let endPoint = coordinates.last
        
        var waypoints = ""
        var markers = [GMSMarker]()
        
        for item in 0..<coordinates.count {
            markers.append(GMSMarker(position: coordinates[item]))
            if item == 0 { continue }
            waypoints += "|\(coordinates[item].latitude),\(coordinates[item].longitude)"
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "origin", value: "\(startPoint.latitude),\(startPoint.longitude)"),
            URLQueryItem(name: "destination", value: "\(endPoint!.latitude),\(endPoint!.longitude)"),
            URLQueryItem(name: "waypoints", value: "optimize:true\(waypoints)"),
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        URLSession.shared.dataTask(with: urlComponents.url!) { data, responce, error in
                //TODO: Find more glorious way
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                guard let routes = json!["routes"] as? NSArray else { return completion(nil, nil, nil)}
                guard let firstElement = routes.firstObject as? [String: Any] else { return completion(nil, nil, nil) }
                guard let bounds = firstElement["bounds"] as? [String: Any] else { return completion(nil, nil, nil) }
                guard let polyline = firstElement["overview_polyline"] as? [String: Any] else { return completion(nil, nil, nil) }
                guard let northeast = bounds["northeast"] as? [String: Double] else { return completion(nil, nil, nil) }
                guard let southwest = bounds["southwest"] as? [String: Double] else { return completion(nil, nil, nil) }
                
                guard let northeastLat = northeast["lat"] else { return completion(nil, nil, nil) }
                guard let northeastLon = northeast["lng"] else { return completion(nil, nil, nil) }
                
                guard let southwestLat = southwest["lat"] else { return completion(nil, nil, nil) }
                guard let southwestLon = southwest["lng"] else { return completion(nil, nil, nil) }
                
                guard let encodedPath = polyline["points"] as? String else { return completion(nil, nil, nil) }
                
                let northeastBound = CLLocationCoordinate2D(latitude: northeastLat, longitude: northeastLon)
                let southwestBound = CLLocationCoordinate2D(latitude: southwestLat, longitude: southwestLon)
                
                let boundsForMap = GMSCoordinateBounds(coordinate: northeastBound, coordinate: southwestBound)
                let path = GMSPath(fromEncodedPath: encodedPath)
                DispatchQueue.main.async {
                    completion(boundsForMap, path, markers)
                }
            }
        }.resume()
    }
}
