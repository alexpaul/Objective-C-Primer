//
//  Item.m
//  ToDoList-Objective-C
//
//  Created by Alex Paul on 2/18/21.
//

#import <Foundation/Foundation.h>

#import "Item.h"

@implementation Item

- (instancetype)initWithName:(NSString *)name andTopic:(NSString *)topic {
  if (self = [super init]) {
    // initialize all properties here....
    self.name = name;
    self.topic = topic;
  }
  return self;
}

+ (NSArray *)fetchItems {
  return @[
    [[Item alloc] initWithName:@"Coffee with Facebook Engineer" andTopic:@"Informational Interview"],
    [[Item alloc] initWithName:@"Phone interview with Snap" andTopic:@"2nd Interview"],
    [[Item alloc] initWithName:@"Review Hash Tables" andTopic:@"DSA"],
    [[Item alloc] initWithName:@"Push app to TestFlight" andTopic:@"iOS app development"],
    [[Item alloc] initWithName:@"Update README for Capstone project" andTopic:@"Github"]
  ];
}

@end
