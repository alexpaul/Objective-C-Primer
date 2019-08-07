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

- (instancetype)initWithDictionary:(NSDictionary *)dict {
  self.collectionId = dict[@"collectionId"];
  self.artistName = dict[@"artistName"];
  self.collectionName = dict[@"collectionName"];
  self.artworkUrl600 = dict[@"artworkUrl600"];
  return self;
}

@end
