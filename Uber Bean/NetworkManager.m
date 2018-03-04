//
//  NetworkManager.m
//  Uber Bean
//
//  Created by Chris Dean on 2018-03-03.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

- (void)makeNetworkRequest {
    
    NSString *urlString = @"https://api.yelp.com/v3/businesses/search?term=cafe&latitude=49.281815&longitude=-123.108414";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [urlRequest addValue:@"Bearer nXySmON0XPR03zka-ON_zxmeLugXD7aKki0GlPUvpUedoSn7_vhkMelS9Y7A-17Pjd5vMlRjj9yi7AMzWpl_WGfD66w-oFxxqknisn9YWKSqvClB4mbKmVn_0zWbWnYx" forHTTPHeaderField:@"Authorization"];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            return;
        }
        [self parseResponseData:data];
    }];
    [dataTask resume];
}

- (void)parseResponseData:(NSData*)data {
    
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if(error != nil) {
        NSLog(@"%@", error);
        return;
    } else if([jsonObject isKindOfClass:[NSDictionary class]]) {
        self.yelpCafeDict = (NSDictionary*)jsonObject;
    }
}

@end
