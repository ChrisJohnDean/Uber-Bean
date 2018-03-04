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
    }
    return self;
}

@end

