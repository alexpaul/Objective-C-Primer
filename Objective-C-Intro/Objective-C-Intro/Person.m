//
//  Person.m
//  Objective-C-Intro
//
//  Created by Alex Paul on 2/4/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

// initializers

- (instancetype)initWithName:(NSString *)name {
  if (self = [super init]) {
    // initialize properites here.
    self.name = name;
  }
  return self; // return newly created instance to caller
}

/*
 init(frame: CGRect) {
   super.init();
 }
 
 init(name: String) {
   self.name = name
 }
 */

// class methods
+ (NSArray *)allPeople {
  Person *alex = [[Person alloc] init];
  alex.name = @"Alex";
  
  Person *bien = [[Person alloc] init];
  bien.name = @"Bien";
  
  // refactor code above to use initWithName:
  
  NSArray *people = @[alex, bien];
  
  return people;
}

// instance methods
- (void)info {
  NSLog(@"The person's name is %@", self.name);
}

@end
