//
//  Podcast.h
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//


@interface Podcast : NSObject

@property(copy) NSString *collectionName;

- (id)init:(NSDictionary *)dict; 

@end
