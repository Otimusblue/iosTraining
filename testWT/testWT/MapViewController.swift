//
//  MapViewController.swift
//  testWT
//
//  Created by Macintosh HD on 3/1/18.
//  Copyright © 2018 testWT. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController {
    
    var mapView : MKMapView!
    override func loadView() {
        //tao 1 view de lam viec
        mapView = MKMapView()
        view = mapView
        
        //tao segment
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged )
        
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // autolayout cho segment
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant : 8)
        let margin = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margin.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0 :
            mapView.mapType = .standard
        case 1 :
            mapView.mapType = .hybrid
        case 2 :
            mapView.mapType = .satellite
        default :
            break
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello MapView")
    }

}
