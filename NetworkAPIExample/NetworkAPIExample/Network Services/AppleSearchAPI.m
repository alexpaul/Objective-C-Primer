//
//  AppleSearchAPI.m
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppleSearchAPI.h"
#import "Podcast.h"

@implementation AppleSearchAPI

- (void)searchPodcast {
  NSString *endpointURL = @"https://itunes.apple.com/search?media=podcast&limit=200&term=swift";
  NSURL *url = [[NSURL alloc] initWithString:endpointURL];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
  
  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error != nil) {
      NSLog(@"error: %@", error);
    } else {
      NSError *error;
      NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (!jsonDict) {
        NSLog(@"Error parsing JSON: %@", error);
      } else {
        NSArray *results = jsonDict[@"results"];
        NSLog(@"found: %ld podcasts", results.count);
        
        for (NSDictionary *podcastDict in results) {
          Podcast *podcast = [[Podcast alloc] init:podcastDict];
          NSLog(@"collection name: %@", podcast.collectionName);
        }
      }
    }
  }];
  [task resume];
}

@end
