//
//  ViewController.m
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import "ViewController.h"
#import "AppleSearchAPI.h"
#import "Podcast.h"
#import "PodcastCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic) AppleSearchAPI *apiClient; // in this @interface block apiClient is private (encapsulation)
@property(nonatomic) NSArray *podcasts;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initializeProperites];
  [self searchPodcast:@"swift"];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  [self.tableView registerNib:[UINib nibWithNibName:@"PodcastCell" bundle:nil] forCellReuseIdentifier:@"NameCell"];
  self.searchBar.delegate = self;
  self.searchBar.placeholder = @"search for podcast";
}

- (void) initializeProperites {
  // the _apiClient property needs to be allocated and initialized or using it will cause
  // methods on that class from getting called, compiler won't crash as in Swift when messages
  // are sent to nil objects
  if (_apiClient == nil) {
    _apiClient = [[AppleSearchAPI alloc] init];
  }
}

- (void)searchPodcast: (NSString *)keyword {
  // can send message to nil if _apiClient is nil, won't cause a compiler crash like in Swift
  // this causes logic errors as in such an example searchPodcast would not be called as expected
  // forgetting that Objective-C does allow messages to be sent to a nil causes unnecessary debugging time
  
  [self.apiClient searchPodcast: keyword: ^(NSArray *podcasts, NSError *error) {
    if(error) {
      NSLog(@"error searching for podcasts: %@", error);
    } else {
      for (Podcast *podcast in podcasts) {
        NSLog(@"%@", podcast.collectionName);
      }
      self.podcasts = podcasts;
      
      dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
      });
    }
  }];
}

#pragma mark: UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _podcasts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  PodcastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PodcastCell"];
  if (!cell) {
    [tableView registerNib:[UINib nibWithNibName:@"PodcastCell" bundle:nil] forCellReuseIdentifier:@"PodcastCell"];
    cell = [tableView dequeueReusableCellWithIdentifier:@"PodcastCell"];
  }
  Podcast *podcast = self.podcasts[indexPath.row];
  cell.collectionNameLabel.text = podcast.collectionName;
  cell.artistNameLabel.text = podcast.artistName; 
  return cell;
}

#pragma mark: UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 150.0;
}

#pragma mark: UISearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  [searchBar resignFirstResponder];
  NSString *searchText = [searchBar.text stringByAddingPercentEncodingWithAllowedCharacters: NSCharacterSet.URLHostAllowedCharacterSet];
  [self searchPodcast:searchText];
  searchBar.text = @"";
}

@end
