//
//  main.m
//  Objective-C-Intro
//
//  Created by Alex Paul on 2/4/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// import Foundation

// declare a (C-style) function
int add(int num1, int num2) {
  return num1 + num2;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // insert code here...
    NSLog(@"Hello, World!");
    // print("Hello, World!")
    
    // use our add function
    int result = add(10, 12); // int is on the Stack
    // %i is a format specifier
    NSLog(@"The result of addition is %i.", result);
    // The result of addition is 22.
    
    // declare a string
    // NSString is an object that allocates
    // memory on the Heap (a place (buffer) in memory)
    NSString *name = @"Bien";
    
    // print name
    NSLog(@"The person's name is %@.", name);
    // The person's name is Bien.
    
    // mutable string
    NSMutableString *language = [[NSMutableString alloc] initWithString: @"The language"];
    // calling an Objective-C funtion
    // [instance methodName];
    // [Class methodName];
    NSLog(@"message: %@", language);
    
    // calling functions in Objective-C
    [language appendString:@" is Objective-C."];
    
    NSLog(@"message: %@", language);
    
    // Swift
    //var language = "The language"
    //language.append(" is Objective-C.")
    
    // array
    NSArray *programmingStacks = @[@"Objective-C", @"Swift", @"Python", @"Java"];
    
    //var programmingStacks = ["Objective-C"] // [String]()
    
    // for-in in Swift
//    for language in programmingStacks {
//      print(language)
//    }
    
    for (NSString *language in programmingStacks) {
      if ([language isEqual:@"Swift"]) {
        NSLog(@"%@ is the best language ever!!!!!", language);
      }
    }
    
    // create an instance of Person
    // call info
    Person *eric = [[Person alloc] init];
    [eric info];
  }
  return 0;
}


// TODOs:
/*
 - NSMutableArray
 - NSDictionary / NSMutableDictionary
 - Objective-C methods (instance and class methods)
 - Initializers
 - Properties
 - Inheritance
 - Create an iOS app
 - Create an iOS app that queries a Web API (NSJSONSerialization)
*/
