//
//  Cafe.m
//  Uber Bean
//
//  Created by Chris Dean on 2018-03-03.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe

- (instancetype)initWithDict:(NSDictionary*)cafe
{
    self = [super init];
    if (self) {
        NSDictionary *coordinateDict = cafe[@"coordinates"];
        
        _imageUrl = cafe[@"image_url"];
        _name = cafe[@"name"];
        _longitude = coordinateDict[@"longitude"];
        _latitude = coordinateDict[@"latitude"];
        _coordinate.longitude = (CLLocationDegrees)[coordinateDict[@"longitude"] doubleValue];
        _coordinate.latitude = (CLLocationDegrees)[coordinateDict[@"latitude"] doubleValue];
    }
    return self;
}

@end

/*
 -We are going to make our Cafe object conform to the MKAnnotation protocol. We will make sure it implements the readonly coordinate property. We will also implemented the optional title property.
 
 -Make Cafe conform to the MKAnnotation protocol.
 -Make sure it has a coordinate property that is a type of CLLocationCoordinate2D
 -Add a title property.
-Now that Cafe is an MKAnnotation, we can just pass the array of Cafes to the map view.
 */
