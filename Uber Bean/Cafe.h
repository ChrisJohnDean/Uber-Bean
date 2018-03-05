//
//  Cafe.h
//  Uber Bean
//
//  Created by Chris Dean on 2018-03-03.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface Cafe : NSObject <MKAnnotation>

//Properties from MKAnnotation protocol
@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, readonly, copy) NSString *title;

@property (nonatomic) NSString *imageUrl;
@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;

- (instancetype)initWithDict:(NSDictionary*)cafe;

@end
