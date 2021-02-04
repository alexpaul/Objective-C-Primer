//
//  Person.m
//  Objective-C-Intro
//
//  Created by Alex Paul on 2/4/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

// class method
//+ (return type)functionName

- (instancetype)initWithName: (NSString *) name {
  return self; 
}


// instance method - (return type)
- (void)info {
  NSLog(@"This is a person.");
}

@end
