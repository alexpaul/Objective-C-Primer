//
//  main.m
//  StarterProject
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

// C-Style function does not return a value so marked with void `
void message() {
  NSLog(@"Hello from Chelsea");
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // insert your test code here.....have fun with your Objective-C playground :-]
    
    NSMutableArray *apps = [[NSMutableArray alloc] init];
    
    [apps addObject:@"Zwift"];
    [apps addObject:@"Instagram"];
    [apps addObject:@"Twitter"];
    
    for (NSString *app in apps) {
      NSLog(@"%@", app);
    }
    
    message();
  }
  return 0;
}
