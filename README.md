# Objective-C Primer for Swift Developers

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

## NSString

```objective-c
NSString *message = @"Welcome to Objective-C"; // oops yeah, ; semicolons are required to end a statement in Obj-C
NSLog(@"%@", message);

// Welcome to Objective-C
```

In Objective-C a * pointer is used to signify an object. An object requires space on the heap, there this * pointer is a location on the heap. Primitives e.g int, float are not objects on the heap and do not have this * in their declaration. 

## NSArray 

```objective-c 
NSArray *programmingStacks = @[@"Swift", @"Objective-C", @"Python", @"C++", @"Java"];
NSLog(@"Currently learning %@", programmingStacks[1]);

// Currently learning Objective-C
```

## NSDictionary 

```objective-c 
NSDictionary *cites = @{@"Sweden": @"Stockholm", @"Japan": @"Tokyo", @"France": @"Paris"};
NSString *city = cites[@"Japan"];
NSLog(@"Capital city of Japan is %@", city);

// Capital city of Japan is Tokyo
```

## Control Flow 

```objective-c 
BOOL isAwesome = NO; // all equivalent, YES, TRUE, true, NO, FALSE, false

if (isAwesome) { // parenthesis are REQUIRED in Obj-C unlike in Swift
  NSLog(@"Objective-C is awesome");
} else {
  NSLog(@"My ♥️ is with Swift");
}

// My ♥️ is with Swift
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

#### Closures in Swift is similar to Blocks in Objective-C

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

## Readiing Resource 

[Apple - Programming with Objective-C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210-CH1-SW1)   
[Apple - Swift Programming Language](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
