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
@property (copy, nonatomic) NSString *urlString;
@end

@implementation PodcastCell

- (void)prepareForReuse {
  [super prepareForReuse];
}

- (void)configureCellWithPodcast: (Podcast *)podcast {
  self.collectionNameLabel.text = podcast.collectionName;
  self.artistNameLabel.text = podcast.artistName;
  // process image data on background thread
  self.urlString = podcast.artworkUrl600;
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:podcast.artworkUrl600]];
    UIImage *image = [UIImage imageWithData:imageData];
    // update UI on main thread
    dispatch_async(dispatch_get_main_queue(), ^{
      if ([self.urlString isEqualToString:podcast.artworkUrl600]) {
        self.podcastImage.image = image;
      }
    });
  });
}

@end
