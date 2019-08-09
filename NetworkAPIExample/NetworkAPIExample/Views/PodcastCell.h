//
//  PodcastCell.h
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/8/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PodcastCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *podcastImage;
@property (weak, nonatomic) IBOutlet UILabel *collectionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;

@end
