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
        _imageUrl = cafe[@"image_url"];
        _name = cafe[@"name"];
        _longitude = cafe[@"longitude"];
        _latitude = cafe[@"latitude"];
    }
    return self;
}

@end
