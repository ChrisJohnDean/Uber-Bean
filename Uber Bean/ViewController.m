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

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, strong) CLLocationManager *manager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;
@property (nonatomic) NetworkManager *networkManager;
@property (nonatomic) NSArray *arrayOfCafes;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[CLLocationManager alloc] init];
    [self.manager requestWhenInUseAuthorization];
    self.manager.delegate = self;
    
    self.mapView.showsUserLocation = YES;
    
    _networkManager = [[NetworkManager alloc] init];
    
    //[self.mapView registerClass:[MKPinAnnotationView class] forAnnotationViewWithReuseIdentifier:@"pinny"];
    self.mapView.delegate = self;
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
    
    self.networkManager.delegate = self;
    [self.networkManager makeNetworkRequestWithLatitude:self.latitude withLongitude:self.longitude];
    
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

- (void)passCafesArray:(NSMutableArray*)arrayOfCafes {
    self.arrayOfCafes = arrayOfCafes;
    for(Cafe *cafe in self.arrayOfCafes) {
        NSLog(@"%@", cafe.name);
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mapView addAnnotations:self.arrayOfCafes];
    });
    [self.mapView showAnnotations:self.arrayOfCafes animated:YES];
   
}

//Lets you add custom changes to your map veiw annotation
//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    
//    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinny" forAnnotation:annotation];
//    if (annotationView) {
//        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinny"];
//    }
//    
//    [self.mapView showAnnotations:self.arrayOfCafes animated:YES];
//    // Do any customization
//    annotationView.canShowCallout = YES;
//    
//    return annotationView;
//}

@end








