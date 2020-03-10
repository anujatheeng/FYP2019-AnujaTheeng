//
//  PolicestationViewController.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 1/23/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON
import CoreLocation


class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(pinTitle:String, pinSubtitle: String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubtitle
        self.coordinate = location
    }
    
}
class PolicestationViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var policestationView: MKMapView!
    let locationManager = CLLocationManager()
    var typeZone : String = ""
    var locatiion = Locations.getLocation()
    let regionInMeters: Double = 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        self.policestationView.delegate = self
        showInMap()
    }
    func showInMap(){
        for locations in locatiion{
            let location = CLLocationCoordinate2D(latitude: locations.latitude ?? 0.0,longitude: locations.longtitude ?? 0.00)
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: location, span: span)
            policestationView.setRegion(region, animated: true)
            let pin = customPin(pinTitle: locations.name ?? "", pinSubtitle: locations.locations ?? "", location: location)
            self.typeZone = locations.type ?? ""
            self.policestationView.addAnnotation(pin)
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "CustomAnnotation")
        if typeZone == "Prone"{
            annotationView.image = UIImage(named: "pin")
        }else{
            annotationView.image = UIImage(named: "location")
        }
        annotationView.canShowCallout = true
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation title == \(String(describing: view.annotation?.title!))")
    }
    func setUpLocationManager(){
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            policestationView.setRegion(region, animated: true)
        }
    }
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManager()
            checkLocationAuthorization()
        }else{
        }
    }
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            policestationView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case.denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case.restricted:
            break
        case.authorizedAlways:
            break
        }
    }
}
extension PolicestationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        let center = CLLocationCoordinate2D.init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        policestationView.setRegion(region, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

