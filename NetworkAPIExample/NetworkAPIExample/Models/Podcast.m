//
//  Podcast.m
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Podcast.h"

@implementation Podcast

- (id)init:(NSDictionary *)dict {
  self.collectionName = dict[@"collectionName"]; 
  return self;
}

@end
