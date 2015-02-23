//
//  MapViewController.swift
//  ExchangeAGram
//
//  Created by Andy Stannard on 11/02/2015.
//  Copyright (c) 2015 inni Accounts. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      //  let request = NSFetchRequest(entityName: "FeedItem")
       // let appDeleegate:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
       // let context = appDeleegate.managedObjectContext!
       // var error:NSError?
        //let itemArray:[FeedItem] = context.executeFetchRequest(request, error: &error)
        
        
        
        let request = NSFetchRequest(entityName: "FeedItem")
        let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context:NSManagedObjectContext = appDelegate.managedObjectContext!
        var error:NSError?
        println("lets query items")
        let itemArray = context.executeFetchRequest(request, error: &error)
        println("done query")
        println(error)
    
        
        if itemArray!.count > 0 {
            
            var lastPhoto = itemArray![itemArray!.count-1] as FeedItem
            let location = CLLocationCoordinate2D(latitude: Double(lastPhoto.latitude), longitude: Double(lastPhoto.longitude))
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegionMake(location, span)
            
            mapView.setRegion(region, animated: true)
            
            
            for item in itemArray! {
                let feedItem = item as FeedItem
                let location = CLLocationCoordinate2D(latitude: Double(feedItem.latitude), longitude: Double(feedItem.longitude))
                let annotation = MKPointAnnotation()
                annotation.setCoordinate(location)
                annotation.title = feedItem.caption;
                
                mapView.addAnnotation(annotation)
                
            }
        }
        
//        let location = CLLocationCoordinate2D(latitude: 48.868639224587, longitude: 2.37119161036255)
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegionMake(location, span)
//        mapView.setRegion(region, animated: true)
//        
//        let annotation = MKPointAnnotation()
//        annotation.setCoordinate(location)
//        annotation.title = "Canal Saint-Martin"
//        annotation.subtitle = "paris"
//        
//        mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
