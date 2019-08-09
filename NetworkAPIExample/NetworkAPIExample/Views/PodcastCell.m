//
//  PodcastCell.m
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/8/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import "PodcastCell.h"

@interface PodcastCell ()
@property (weak, nonatomic) IBOutlet UIImageView *podcastImage;
@property (weak, nonatomic) IBOutlet UILabel *collectionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@end

@implementation PodcastCell

- (void)configureCellWithPodcast: (Podcast *)podcast {
  self.collectionNameLabel.text = podcast.collectionName;
  self.artistNameLabel.text = podcast.artistName;
}

@end
