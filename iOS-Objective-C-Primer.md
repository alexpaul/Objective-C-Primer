# iOS Objective-C Primer

## Parsing JSON in Objective-C

NSJSONSerialization class is used to parse JSON objects in Objective-C. At the top level it expects an NSArray or NSDictionary. 

```objective-c
NSError *error;
NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
  if (!jsonDict) {
        completionBlock(nil, error);
} else {
  NSArray *results = jsonDict[@"results"];
  NSMutableArray *podcasts = [[NSMutableArray alloc] init];
  for (NSDictionary *podcastDict in results) {
    Podcast *podcast = [[Podcast alloc] initWithDictionary:podcastDict];
    [podcasts addObject:podcast];
  }
  completionBlock(podcasts, nil);
}
```

## Making Network calls in Objective-C with NSURLSession 

```objective-c 
NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
  // code here
  // see API Client below or the complete NetworkAPIExample Xcode project for complete implementation
}
```

## API Client 

#### AppleSearchAPI.h 
```objective-c 
@interface AppleSearchAPI : NSObject

- (void)searchPodcast: (void (^)(NSError *, NSArray *))completionBlock;

@end
```

#### AppleSearchAPI.m
```objective-c 
#import <Foundation/Foundation.h>
#import "AppleSearchAPI.h"
#import "Podcast.h"

@implementation AppleSearchAPI

- (void)searchPodcast: (void (^) (NSError *, NSArray *))completionBlock {  
  NSString *endpointURL = @"https://itunes.apple.com/search?media=podcast&limit=200&term=swift";
  NSURL *url = [[NSURL alloc] initWithString:endpointURL];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
  
  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error != nil) {
      NSLog(@"error: %@", error);
      completionBlock(error, nil);
    } else {
      NSError *error;
      NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (!jsonDict) {
        NSLog(@"Error parsing JSON: %@", error);
      } else {
        NSArray *results = jsonDict[@"results"];
        NSMutableArray *podcasts = [[NSMutableArray alloc] init];
        for (NSDictionary *podcastDict in results) {
          Podcast *podcast = [[Podcast alloc] init:podcastDict];
          [podcasts addObject:podcast];
        }
        completionBlock(nil, podcasts);
      }
    }
  }];
  [task resume];
}

@end
```

## Model

#### Podcast.h 

```objective-c 
@interface Podcast : NSObject

@property(nonatomic) NSNumber *collectionId;
@property(copy) NSString *artistName;
@property(copy) NSString *collectionName;
@property(copy) NSString *artworkUrl600; 

- (id)init:(NSDictionary *)dict; 

@end
```

#### Podcast.m 

```objective-c 
#import <Foundation/Foundation.h>
#import "Podcast.h"

@implementation Podcast

- (id)init:(NSDictionary *)dict {
  self.collectionId = dict[@"collectionId"];
  self.artistName = dict[@"artistName"];
  self.collectionName = dict[@"collectionName"];
  self.artworkUrl600 = dict[@"artworkUrl600"];
  return self;
}

@end
```

## Protocols 

#### Declaring conformance to a Protocol 
```objective-c 
@interface ViewController () <UITableViewDataSource>
```

## ViewController

#### ViewController.h

Here the ViewController is importing UIKit and subclassing from UIViewController, pay attention to the Objective-C syntax here as opposed to Swift. 

```objective-c
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end
```

#### ViewController.m

The code within the @interface block in the ViewController.m implementation file here will be private to outside classes. This is a great example of encapsulation in Object Oriented Programming. Internal implementations only specific to this class remains private. 

```objective-c 
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}


@end
```
