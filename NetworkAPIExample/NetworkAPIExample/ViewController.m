//
//  ViewController.m
//  NetworkAPIExample
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import "ViewController.h"
#import "AppleSearchAPI.h"

@interface ViewController ()
@property AppleSearchAPI *apiClient;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initializeProperites];
  [self searchPodcast];
} 

- (void) initializeProperites {
  // the _apiClient property needs to be allocated and initialized or using it will cause
  // methods on that class from getting called, compiler won't crash as in Swift when messages
  // are sent to nil objects
  if (_apiClient == nil) {
    _apiClient = [[AppleSearchAPI alloc] init];
  }
}

- (void)searchPodcast {
  
  // can send message to nil if _apiClient is nil, won't cause a compiler crash like in Swift
  // this causes logic errors as in such an example searchPodcast would not be called as expected
  // forgetting that Objective-C does allow messages to be sent to a nil causes unnecessary debugging time
  [self.apiClient searchPodcast];
}

@end
