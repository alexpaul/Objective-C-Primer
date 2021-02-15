//
//  Person.h
//  Objective-C-Intro
//
//  Created by Alex Paul on 2/4/21.
//

@interface Person : NSObject

// properties
@property NSString *name;

//let name: String

// initializers
- (instancetype) initWithName: (NSString *) name;

// methods

// class methods
+ (NSArray *)allPeople;


// instance method
- (void)info;

@end
