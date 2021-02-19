# Introduction to Objective-C 

In this lesson we introduce Objective-C via a command line macOS application. We introduce data types and syntax such as creating NSString objects, NSArray's and iteracting using the for-in loop. We also create a custom `Person` object via a header file and an implementation file. 

## [Video - Part 1](https://youtu.be/2CPt99dnroQ)

## Lesson TODOs 

- [x] Printing to the console 
- [x] Writing and calling C-stype functions 
- [x] Using `Format Specifiers` like `%i` and `%@` to interpolate data types in strings
- [x] Using `NSString`
- [x] Using `NSMutableString`
- [x] Using `NSArray`
- [x] Using the `for-in` loop 
- [x] Testing for equality on strings 
- [x] Creating a custom object via a header and implementation file e.g `Person.h` and `Person.m`
- [x] NSMutableArray
- [x] NSDictionary / NSMutableDictionary
- [x] Objective-C methods (instance and class methods)
- [x] Initializers
- [x] Properties
- [x] Inheritance
- [ ] Polymorphism
- [ ] Create an iOS app
- [ ] Create an iOS app that queries a Web API (NSJSONSerialization)

## Part 2 

## [Video - Part 2](https://youtu.be/kCPcS5RG6p8)

## 1. NSMutableArray

```objective-c
NSMutableArray *raceTypes = [[NSMutableArray alloc] init];
[raceTypes addObject:@"Marathon"];
[raceTypes addObject:@"10k"];
[raceTypes addObject:@"5k"];
[raceTypes addObject:@"Half-Marathon"];
```

## 2. NSDictionary

```objective-c
NSDictionary *places = @{@"New York": @"Brooklyn", @"Sweden": @"Malmo"};
//[places setValue:@"Los Angeles" forKey:@"California"];
// compiler error - we can't modify a NSDictionary we have to use a
// NSMutableDictionary
for (NSString *place in places) {
  NSString *placeValue = places[place];
  NSLog(@"%@ is in %@", placeValue, place);
}
```

## 3. NSMutableDictionary

```objective-c
NSMutableDictionary *platform = [[NSMutableDictionary alloc] init];
[platform  setObject:@"iOS apps" forKey:@"iOS"];
```

## 4. Objective-C methods (instance and class methods)

Person.h 
```objective-c 
@interface Person : NSObject

// methods
+ (NSArray *)allPeople; 
- (void)info;

@end
```

Person.m
```objective-c 
@implementation Person 

// class method
+ (NSArray *)allPeople {
  Person *alex = [[Person alloc] init];
  alex.name = @"Alex";
  Person *tom = [[Person alloc] init];
  tom.name = @"Tom";
  
  NSMutableArray *people = [[NSMutableArray alloc] initWithObjects:alex, tom, nil];
  
  // using custom initializer
  Person *cindy = [[Person alloc] initWithName:@"Cindy"];
  
  // add to array
  [people addObject:cindy];
  
  return people;
}

// instance method
- (void)info {
  NSLog(@"This is a person.");
}

@end
```

main.m
```objective-c
NSMutableArray *people = [[NSMutableArray alloc] initWithArray:[Person allPeople]];
NSLog(@"Currently there are %lu people.", people.count );
```

## 5. Properties

Person.h
```objective-c
@interface Person : NSObject

// properties
@property NSString *name;

@end
```

main.m
```objective-c
Person *firstPerson = [Person allPeople][0];
NSLog(@"The first person in the array is %@", firstPerson.name); 
```

## 6. Initializers

Person.h
```objective-c 
@interface Person : NSObject

// initializers
- (instancetype)initWithName: (NSString *) name;

@end
```

Person.m 
```objective-c 
@implementation Person

// https://developer.apple.com/documentation/objectivec/nsobject/1418641-init?language=objc
- (instancetype)initWithName: (NSString *) name {
  if (self = [super init]) {
    self.name = name;
  }
  return self;
}

@end
```

main.m
```objective-c
Person *outsider = [[Person alloc] initWithName:@"Amos"];
[people addObject:outsider];
NSLog(@"Currently there are %lu people.", people.count );
```

## 7. Inheritance e.g a Fellow is a Person

Fellow.h
```objective-c
#import "Person.h"

@interface Fellow : Person

// we can add custom methods on the Fellow object here

@end
```

Fellow.m
```objective-c
#import <Foundation/Foundation.h>
#import "Fellow.h"

@implementation Fellow

// we can implement custom methods on the Fellow object here

@end
```

main.m
```objective-c
Fellow *fellow = [[Fellow alloc] initWithName:@"Bob"];
NSLog(@"The fellow's name is %@.", fellow.name);
```







