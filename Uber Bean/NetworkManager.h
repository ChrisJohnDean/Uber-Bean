//
//  NetworkManager.h
//  Uber Bean
//
//  Created by Chris Dean on 2018-03-03.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkManager;
@protocol cafesDelegate <NSObject>

- (void)passCafesArray:(NSMutableArray*)arrayOfCafes;

@end

@interface NetworkManager : NSObject

@property (nonatomic, weak) id<cafesDelegate> delegate;

@property (nonatomic) NSDictionary *yelpCafeDict;
@property (nonatomic) NSMutableArray *arrayOfCafes;
- (void)makeNetworkRequestWithLatitude:(NSString*)latitude withLongitude:(NSString*)longitude;
- (void)parseResponseData:(NSData*)data;


@end
