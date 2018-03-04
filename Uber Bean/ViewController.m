//
//  ViewController.m
//  Uber Bean
//
//  Created by Chris Dean on 2018-03-02.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "ViewController.h"
@import CoreLocation;
@import MapKit;
#import "Cafe.h"

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[CLLocationManager alloc] init];
    [self.manager requestWhenInUseAuthorization];
    self.manager.delegate = self;
    
    self.mapView.showsUserLocation = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *myLocation = locations[0];
    CLLocationCoordinate2D coord = myLocation.coordinate;
    self.latitude = [[NSNumber numberWithDouble:coord.latitude] stringValue];
    self.longitude = [[NSNumber numberWithDouble:coord.longitude] stringValue];
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, MKCoordinateSpanMake(2.0/111, 2.0/111));
    self.mapView.region = region;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [self.manager requestLocation];
    }
}



@end










