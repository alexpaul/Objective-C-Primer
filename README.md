# Objective-C Primer for Swift Developers

## Objective-C 

Wikepidia: The programming language Objective-C was originally developed in the early 1980s. It was selected as the main language used by NeXT for its NeXTSTEP operating system, from which macOS and iOS are derived.

You will encounter the prefix **NS** used on types throughout Objective-C as a result of it being used at NeXTSTEP. A company that was started by Steve Jobs when he was ousted by Apple in the last 1980s. NeXTSTEP would be later acquired and Steve Jobs would rejoin Apple. The rest is history as we know it.....

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

## NSString

```objective-c
NSString *message = @"Welcome to Objective-C";
NSLog(@"%@", message);

// Welcome to Objective-C
```

In Objective-C a * pointer is used to signify an object. An object requires space on the heap, there this * pointer is a location on the heap. Primitives e.g int, float are not objects on the heap and do not have this * in their declaration. 

## Control Flow 

```objective-c 
BOOL isAwesome = NO; // all equivalent, YES, TRUE, true, NO, FALSE, false

if (isAwesome == TRUE) {
  NSLog(@"Objective-C is awesome");
} else {
  NSLog(@"My ♥️ is with Swift");
}

// My ♥️ is with Swift
```
