//
//  Podcast.h
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//


@interface Podcast : NSObject

@property(nonatomic) NSNumber *collectionId;
@property(copy) NSString *artistName;
@property(copy) NSString *collectionName;
@property(copy) NSString *artworkUrl600; 

- (id)initWithDictionary:(NSDictionary *)dict; 

@end
