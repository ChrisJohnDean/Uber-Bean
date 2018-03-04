//
//  NetworkManager.h
//  Uber Bean
//
//  Created by Chris Dean on 2018-03-03.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

- (void)makeNetworkRequest;
- (void)parseResponseData:(NSData*)data;

@property (nonatomic) NSDictionary *yelpCafeDict;

@end
