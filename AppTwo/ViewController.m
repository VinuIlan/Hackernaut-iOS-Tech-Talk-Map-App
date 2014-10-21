//
//  ViewController.m
//  AppTwo
//
//  Created by Vinu Ilangovan on 4/1/14.
//  Copyright (c) 2014 Vinu Ilangovan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>

@end

@implementation ViewController

@synthesize mapview;

-(IBAction)mapType:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
            
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;

        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}

-(IBAction)getLocation:(id)sender {
    mapview.showsUserLocation = YES;
    mapview.userTrackingMode = YES;
    
}

-(IBAction)alertMe:(id)sender {
    
    if (mapview.showsUserLocation == YES) {
        NSLog(@"alertme called");
        locmanager.delegate = self;
        locmanager.desiredAccuracy = kCLLocationAccuracyBest;
        
        gotlocation = FALSE;
        
        [locmanager startUpdatingLocation];
        
    }
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSInteger x = locations.count - 1;
    
    if (gotlocation == FALSE) {
        startLoc = locations[x];
        //NSLog(@" %@", locations[x]);
        gotlocation = TRUE;
    }
    
    int distance = [locations[x] distanceFromLocation:startLoc];
    
    if (distance > 100) {
        //NSLog(@" %@", locations[x]);
        //NSLog(@"send alert");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!!!" message:@"You are now leaving the set location" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        
        [alert show];
        
        [locmanager stopUpdatingLocation];
    }
    
    
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locmanager = [[CLLocationManager alloc] init];
    gotlocation = TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
