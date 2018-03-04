//
//  NetworkManager.h
//  Uber Bean
//
//  Created by Chris Dean on 2018-03-03.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

@property (nonatomic) NSDictionary *yelpCafeDict;

- (void)makeNetworkRequestWithLatitude:(NSString*)latitude withLongitude:(NSString*)longitude;
- (void)parseResponseData:(NSData*)data;


@end
