//
//  NetworkManager.m
//  Uber Bean
//
//  Created by Chris Dean on 2018-03-03.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "NetworkManager.h"
#import "Cafe.h"

@implementation NetworkManager

- (void)makeNetworkRequestWithLatitude:(NSString*)latitude withLongitude:(NSString*)longitude {
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.yelp.com/v3/businesses/search?term=cafe&latitude=%@&longitude=%@", latitude, longitude];
    NSLog(urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    //[urlRequest setValue:Autho forHTTPHeaderField:<#(nonnull NSString *)#>]
    [urlRequest addValue:@"Bearer nXySmON0XPR03zka-ON_zxmeLugXD7aKki0GlPUvpUedoSn7_vhkMelS9Y7A-17Pjd5vMlRjj9yi7AMzWpl_WGfD66w-oFxxqknisn9YWKSqvClB4mbKmVn_0zWbWnYx" forHTTPHeaderField:@"Authorization"];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            return;
        }
        //NSError *error = nil;
        //id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        self.yelpCafeDict = jsonObject;
        [self parseResponseData:data];
    }];
    [dataTask resume];
}

- (void)parseResponseData:(NSData*)data {
    
    NSError *error = nil;
    //id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if(error != nil) {
        NSLog(@"%@", error);
        return;
    }
    self.yelpCafeDict = jsonObject;
    
    NSArray *cafeArray = self.yelpCafeDict[@"businesses"];
    for(NSDictionary *dict in cafeArray) {
        Cafe *cafe = [[Cafe alloc] initWithDict:dict];
        [self.arrayOfCafes addObject:cafe];
        NSLog(@"repo: %@", dict[@"name"]);
    }

}


@end
