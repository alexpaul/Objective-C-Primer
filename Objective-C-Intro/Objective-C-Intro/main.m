//
//  main.m
//  Objective-C-Intro
//
//  Created by Alex Paul on 2/4/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Fellow.h"

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
    //let name = "Bien"
    
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
    
    // NSMutableArray
    NSMutableArray *raceTypes = [[NSMutableArray alloc] init];
    
    // var raceTypes = [String]()
    // raceTypes.append("Marathon")
    
    [raceTypes addObject:@"Marathon"];
    [raceTypes addObject:@"10k"];
    [raceTypes addObject:@"Half marathon"];
    [raceTypes addObject:@"Triathlon"];
    
    for (NSString *raceType in raceTypes) {
      NSLog(@"race type is %@", raceType);
    }
    
    // NSDictionary
    NSDictionary *placesDict = @{@"New York": @"Brooklyn", @"Sweden": @"Malmo"};
    
    // let placesDict = ["New York": "Brooklyn", "Sweden": "Malmo"]
    
    for (NSString *placeKey in placesDict) {
      NSString *placeValue = placesDict[placeKey];
      NSLog(@"The place key is %@ and the value is %@", placeKey, placeValue);
    }
    
    // NSMutableDictionary
    NSMutableDictionary *platform = [[NSMutableDictionary alloc] init];
    [platform setObject:@"iOS apps" forKey:@"iOS"];
    [platform setObject:@"Android apps" forKey:@"Java"];

    NSLog(@"Currently we have %lu two stacks.", (unsigned long)platform.count);
    
    // Objective-C methods (class methods and instance methods)
    
    // create an object called Person in Swift
    // struct Person {}
    // create two files: Person.h and Person.m
    // Person.h declares the methods
    // Person.m implements the methods
    
    // instance methods are called on instance of an object
    Person *person = [[Person alloc] init];
    [person info];
    
    // person.info();
    
    // Properties
    person.name = @"John Appleseed";
    NSLog(@"The person's name is %@", person.name);
    
    // class methods are called on the class itself
    NSArray *people = [Person allPeople];
    
    NSLog(@"There are %lu of people", (unsigned long)people.count);
    for (Person *person in people) {
      NSLog(@"The person's name is %@", person.name);
    }
    
    //people = nil;
    
    if (people.count > 0) {
      Person *firstPerson = people[0];
      NSLog(@"The first person is %@", firstPerson.name);
    }
    
    // initializers
    Person *tom = [[Person alloc] initWithName:@"Tom"];
    [tom info];
    
    // inheritance
    Fellow *neema = [[Fellow alloc] initWithName:@"Neema"];
    [neema info];
    
    // challenge: override info to print "The fellow's name" instead
    
    // @sythesized
    
    // setter and getter methods 
  }
  return 0;
}
