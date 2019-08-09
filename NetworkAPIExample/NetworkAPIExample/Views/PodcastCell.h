//
//  PodcastCell.h
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/8/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Podcast.h"

@interface PodcastCell : UITableViewCell

- (void)configureCellWithPodcast: (Podcast *)podcast;

@end
