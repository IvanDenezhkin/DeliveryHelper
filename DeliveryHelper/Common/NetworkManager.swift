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
import SwiftyJSON

class NetworkManager {
    static let basicURL = "https://maps.googleapis.com/maps/api/directions/json?"
    static let apiKey = "AIzaSyDoPDBCZdha7bxBn5kFdX8rt3Hx90ZR-rc"
    
    static func getRoute(withCoordinates coordinates: [CLLocationCoordinate2D], completion: @escaping((mapConfig: GMSCoordinateBounds, path: GMSPath?, markers: [GMSMarker])?, _ error: Error?) -> ()) {
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
            guard let unwrapedData = data else { completion(nil, NetworkError.noData); return }
            let json = JSON(unwrapedData)
            
            guard let northeastLat = json["routes"][0]["bounds"]["northeast"]["lat"].double else {
                completion(nil, NetworkError.noCoordinates)
                return
            }
            let northeastLon = json["routes"][0]["bounds"]["northeast"]["lng"].doubleValue
            
            guard let southwestLat = json["routes"][0]["bounds"]["southwest"]["lat"].double else {
                completion(nil, NetworkError.noCoordinates)
                return
            }
            let southwestLon = json["routes"][0]["bounds"]["southwest"]["lng"].doubleValue
            
            guard let polyline = json["routes"][0]["overview_polyline"]["points"].string else {
                completion(nil, NetworkError.noPolyline)
                return
            }
            
            let northeastBound = CLLocationCoordinate2D(latitude: northeastLat, longitude: northeastLon)
            let southwestBound = CLLocationCoordinate2D(latitude: southwestLat, longitude: southwestLon)
            
            let boundsForMap = GMSCoordinateBounds(coordinate: northeastBound, coordinate: southwestBound)
            let path = GMSPath(fromEncodedPath: polyline)
            DispatchQueue.main.async {
                completion((mapConfig: boundsForMap, path: path, markers: markers), nil)
            }
            }.resume()
    }
}
