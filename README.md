# Objective-C Fundamentals Primer for Swift Developers

## Objective-C 

Wikepidia: The programming language Objective-C was originally developed in the early 1980s. It was selected as the main language used by NeXT for its NeXTSTEP operating system, from which macOS and iOS are derived.

You will encounter the prefix **NS** used on types throughout Objective-C as a result of it being used at NeXTSTEP. A company that was started by Steve Jobs when he was ousted by Apple in the last 1980s. NeXTSTEP would be later acquired and Steve Jobs would rejoin Apple. The rest is history as we know it.....

## Getting Starting with Objective-C as a Command-Line app 

* Open up Xcode 
* Navigate to File -> New -> Project
* Select macOS Template and Command Line Tool 
* Name the Project 
* For Language, select Objective-C, then create. 

When your Project has been created, navigate to **main.m** This main file will be used as a "Playground" for tesing the Objective-C code snippets. The **main.m** file should be similar to the snippet below

```objective-c 
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    // code here
    NSLog(@"Hello, World");
    
  }
  return 0;
}
```

Run the Project and you should now see ```Hello, World``` printed in the console. 

#### [StarterProject Xcode Project](https://github.com/alexpaul/Objective-C-Primer/tree/master/StarterProject)

## Printing to the Console 

**Objective-C** 
```objective-c
NSLog(@"Hello, World");
```

**Swift** 
```swift 
print("Hello, World") 
```

## Some Primitive Types in Objective-C 

* int 
* float 
* double 
* BOOL 

## Format Specifiers 

> %@ object such as NSString  
> %d int, NSInteger  
> %f float  

```objective-c 
// %@ example
NSString *wwdc2019 = @"SwiftUI";
NSLog(@"%@ was introduced at WWDC 2019", wwdc2019);
// SwiftUI was introduced at WWDC 2019

// %d example
int olympics = 2020;
NSLog(@"The next Summer Olympics will be held in %d", olympics);
// The next Summer Olympics will be held in 2020

// %f example
float currentIOSClass = 5.3;
NSLog(@"My current iOS class is %0.1f", currentIOSClass); // using %0.1f sets the float result to 1 decimal place
// My current iOS class is 5.3
```

## NSString

```objective-c
NSString *message = @"Welcome to Objective-C"; // oops yeah, ; semicolons are required to end a statement in Obj-C
NSLog(@"%@", message);

// Welcome to Objective-C
```

## NSMutableString - contents can be edited

```objective-c
NSMutableString *firstName = [[NSMutableString alloc] init];
[firstName appendString:@"Sal"];
NSLog(@"%@", firstName); // Sal
[firstName appendString:@"ly"]; // Sally
NSLog(@"%@", firstName);
```

In Objective-C a * pointer is used to signify an object. An object requires space on the heap, there this * pointer is a location on the heap. Primitives e.g int, float are not objects on the heap and do not have this * in their declaration. 

## NSArray 

```objective-c 
NSArray *programmingStacks = @[@"Swift", @"Objective-C", @"Python", @"C++", @"Java"];
NSLog(@"Currently learning %@", programmingStacks[1]);

// Currently learning Objective-C
```

## NSMutableArray - adds modification operations

```objective-c
NSMutableArray *children = [[NSMutableArray alloc] init];
[children addObject:@"Miles"];
[children addObject:@"Norah"];
NSLog(@"%@", children);
/*
(
    Miles,
    Norah
)
*/
```

## NSDictionary 

```objective-c 
NSDictionary *cites = @{@"Sweden": @"Stockholm", @"Japan": @"Tokyo", @"France": @"Paris"};
NSString *city = cites[@"Japan"];
NSLog(@"Capital city of Japan is %@", city);

// Capital city of Japan is Tokyo
```

## NSMutableDictionary - adds modification operations

```objective-c
NSMutableDictionary *spokenLanguages = [[NSMutableDictionary alloc] init];
spokenLanguages[@"United States"] = @"English";
spokenLanguages[@"Columbia"] = @"Spanish";
NSLog(@"%@", spokenLanguages);
/*
 {
   Columbia = Spanish;
   "United States" = English;
 }
*/
```

## Control Flow 

#### if/else 
```objective-c 
BOOL isAwesome = NO; // all equivalent, YES, TRUE, true, NO, FALSE, false

if (isAwesome) { // parenthesis are REQUIRED in Obj-C unlike in Swift
  NSLog(@"Objective-C is awesome");
} else {
  NSLog(@"My ♥️ is with Swift");
}

// My ♥️ is with Swift
```

#### C-Style for loop 
```objective-c 
for (int i = 0; i <= 10; i++) {
  NSLog(@"%d", i);
}

/*
0
1
.
.
10
*/
```

#### for-in (fast-enumeration)
```objective-c 
NSArray *pursuitClasses = @[@"android", @"iOS", @"web"];
for (NSString *pursuitClass in pursuitClasses) {
  NSLog(@"This is the %@ class", pursuitClass);
}

// This is the android class
// This is the iOS class
// This is the web class
```

## Functions 

#### C-Style Functions
```objective-c
int add(int num1, int num2) {
  return num1 + num2;
}

// usage
int result = add(5, 4);
NSLog(@"result of adding numbers is: %d", result); // format specifier for int is %d

// result of adding numbers is: 9
```

#### Objective-C Functions 

Here we have an **@interface** declaration which acts as a template (later we will separate the @interface file in a .h file). Also we have an **@implementation** declaration that defines the function body (also we will be separating the @implementation file into a .m file)

We will continue to visit classes in Objective-C later, for now this snippet makes use of a class called ClassExample in this Function illustration. 

```objective-c 
@interface ClassExample: NSObject
- (NSString *) greeting:(NSString *)name;
@end

@implementation ClassExample
- (NSString *)greeting:(NSString *)name {
  NSString *newString = [NSString stringWithFormat:@"%@, hope you're enjoying all the [] bracket syntax in obj-c 😃", name];
  return newString;
}
@end

// usage 
ClassExample *classInstance = [[ClassExample alloc] init];
NSString *resultString = [classInstance greeting:@"Rachel"];
NSLog(@"Modified string is %@", resultString);

// Rachel, hope you're enjoying all the [] bracket syntax in obj-c 😃
```

#### Sending messages to a nil Object (does NOT crash in Objective-C which leads to logic errors and debugging time)  

```objective-c 
- (void) initializeProperites {
  // the _apiClient property needs to be allocated and initialized or using it will cause
  // methods on that class from getting called, compiler won't crash as in Swift when messages
  // are sent to nil objects
  if (_apiClient == nil) {
    _apiClient = [[AppleSearchAPI alloc] init];
  }
}

- (void)searchPodcast {
  
  // can send message to nil if _apiClient is nil, won't cause a compiler crash like in Swift
  // this causes logic errors as in such an example searchPodcast would not be called as expected
  // forgetting that Objective-C does allow messages to be sent to a nil causes unnecessary debugging time
  [self.apiClient searchPodcast];
}
```

## Blocks in Objective-C (Closures in Swift) 

#### Closures in Swift
```swift 
func closureExample(num1: Int, num2: Int,
                    closure: (Int, Int) -> (Int)) -> Int {
  return closure(num1, num2)
}

let result = closureExample(num1: 10, num2: 5) { $0 * $1 }
print(result) // 50
```

#### Blocks in Objective-C is similkart to Closures in Swift

This Block does not take any parameters and does not return a value. 

```objective-c 
void(^sampleBlock)(void);

sampleBlock = ^{
  NSLog(@"You may know me as a closure in Swift, however in Objective-C I'm called a Block");
};
    
sampleBlock();
// You may know me as a closure in Swift, however in Objective-C I'm called a Block
```

The Block below takes two parameters of type int and returns an int value. 

```objective-c 
int(^blockExample)(int, int);

blockExample = ^(int num1, int num2){
  return num1 + num2;
};
    
int result = blockExample(7, 21);
NSLog(@"result from block example calculation %d", result);

// result from block example calculation 28
```

#### Passing Blocks as Parameters in Functions 

Header file
```objective-c 
- (void)searchPodcast: (void (^)(NSError *, NSArray *))completionBlock;
```

Implementation file
```objective-c 
- (void)searchPodcast: (void (^) (NSError *, NSArray *))completionBlock {  
  // code here
}
```

## Enumerations

```objective-c 
typedef NS_ENUM(NSInteger, NetworkError) {
  BadURL = 0,
  BadStatusCode = 1,
  APIError = 2
};

NetworkError networkError;
networkError = BadStatusCode;
switch (networkError) {
  case BadURL:
    NSLog(@"Bad URL");
    break;
  case BadStatusCode:
    NSLog(@"Bad Status Code");
    break;
  case APIError:
    NSLog(@"API Error");
    break;
}
// above if a break is not used at the end of each case it will act a a "fallthrough" in Swift

// Bad Status Code
```

## C structure 

```objective-c 
typedef struct {
  CGFloat latitude;
  CGFloat longitude;
} Coordinate;


Coordinate coordinate;
coordinate.latitude = 40.6;
coordinate.longitude = 73.345;

NSLog(@"coordinate is %0.2f, %0.2f", coordinate.latitude, coordinate.longitude);

// coordinate is 40.60, 73.34
```

## Classes 

As opposed to Swift in Objective-C one file does not hold the full class (Model) implementation. A full class in Objective-C are separated into two files, a header file (.m extension) and an implementation file (.h extension). 

The header file is interface (template) for the methods, initializers of the class. The body of the methods are not implemented in the interface file. 

The implementations details and method body logic are implemented in the .m file.  

#### Header file (.h Objective-C file extension) 
```objective-c 
@interface User : NSObject

// Properties
@property (copy) NSString *username;

// Methods: instance and class methods
// class methods are prefixed with a +
// instance is prefixed with a -
- (void)userInfo;

// Initializers

@end
```

#### Implementation file (.m Objective-C file extension)
```objective-c 
@implementation User

- (void)userInfo {
  NSLog(@"Current logged user is %@", _username);
}

@end
```
#### [ClassExample Xcode Project](https://github.com/alexpaul/Objective-C-Primer/tree/master/ClassExample)  

## Properties 

#### readonly - property will not be allowed to change through the setter property
```objective-c 
@property (readonly) NSString *fullName;
```

#### readwrite - can read and write to this property - default property attribute, no need to specify this attribute
```objective-c 
@property (readwrite) NSString *username;
```

#### copy - the copy attribute allows the property to keep a copy of itself so it's not later mutated unintentionally
```objective-c 
// in header file
@property (copy) NSString *firstName;

// usage in main.m  
NSMutableString *mutatingString = [[NSMutableString alloc] initWithString:@"@randomUser"];

user.username = mutatingString;


[user userInfo]; // Current logged user is @randomUser


[mutatingString appendString:@"Yoda"];

[user userInfo];

// if copy is not used on the username property
// output: Current logged user is @randomUserYoda

// if copy is used on the username property, it's original copy is maintained
// output: Current logged user is @randomUser
```

## Next Steps

Now that you have some Objective-C language specifics take a look at the Networking sample project in this repo. It uses NSURLSession to query the Apple Search API for Podcasts. [Project Link](https://github.com/alexpaul/Objective-C-Primer/tree/master/NetworkAPIExample) 

## Reading Resources

[Apple - Programming with Objective-C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210-CH1-SW1)   
[Apple - Swift Programming Language](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)    
[Apple - Language Interoperability](https://developer.apple.com/documentation/swift/cocoa_design_patterns)
