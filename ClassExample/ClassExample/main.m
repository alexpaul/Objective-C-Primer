//
//  main.m
//  ClassExample
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // memory needs to be explicitly alloc(atted) and init(ialized) in order to start using the "user" instance
    User *user = [[User alloc] init];
    
    // setting and accessing a roperty is similar to Swift, as in Swift we use dot syntax
    user.username = @"@objcProgrammer";
    
    // the syntax for (calling a method) is [instanceName methodName];
    [user userInfo]; // Current logged user is @objcProgrammer
    
    
    NSMutableString *mutatingString = [[NSMutableString alloc] initWithString:@"@randomUser"];
    
    user.username = mutatingString;
    
    
    [user userInfo]; // Current logged user is @randomUser
    
    
    [mutatingString appendString:@"Yoda"];
    
    [user userInfo];
    
    // if copy is not used on the username property
    // output: Current logged user is @randomUserYoda
    
    // if copy is used on the username property, it's original copy is maintained
    // output: Current logged user is @randomUser
    
    
  }
  return 0;
}
