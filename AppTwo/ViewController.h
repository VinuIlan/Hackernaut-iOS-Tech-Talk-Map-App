//
//  ViewController.h
//  AppTwo
//
//  Created by Vinu Ilangovan on 4/1/14.
//  Copyright (c) 2014 Vinu Ilangovan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController {
    
    MKMapView *mapview;
    
    CLLocationManager *locmanager;
    
    CLLocation *startLoc;
    
    BOOL gotlocation;
    
}

@property (nonatomic, retain) IBOutlet MKMapView *mapview;

-(IBAction)mapType:(id)sender;

-(IBAction)getLocation:(id)sender;

-(IBAction)alertMe:(id)sender;

@end
