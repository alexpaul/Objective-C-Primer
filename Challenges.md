# Challenges 

#### 1. Write a program that subtracts the value 15 from 87 and displays the result, together with an appropriate message. 

```objective-c 
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // code here
  }
  return 0;
}
```

<details>
  <summary>Solution</summary> 
  
```objective-c 
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    int result = 87 - 15;
    NSLog(@"The result of subtracting 15 from 87 is %i", result);
  }
  return 0;
}
```

</details> 

***

#### 2. Create an object you use e.g  a `Car` and write five actions (methods) you perform on that object. 

<details>
  <summary>Solution</summary> 
  
Car.h 
```objective-c 
@interface Car : NSObject
- (void)drive;
- (void)brake;
- (void)playMusic;
- (void)activateCruiseControl;
- (void)park;
@end
```

Car.m
```objective-c 
#import <Foundation/Foundation.h>
#import "Car.h"

@implementation Car

- (void)drive {
  NSLog(@"Diving and enjoying the open roads."); 
}

- (void)brake {
  // code here
}

- (void)playMusic{
  // code here
}

- (void)activateCruiseControl{
  // code here
}

- (void)park{
  // code here
}

@end
```

main.m
```objective-c 
Car *car = [[Car alloc] init];
[car drive];
// Diving and enjoying the open roads.
```

</details> 

***

#### 3. Define a class caleed `XYPoint` that will hold a Cartesian coordinate `(x, y)`, where `x` and `y` are integers. Define methods to individually set `x` and `y` coordinates of a point and retrieve their values. Write an Objective-C program to implement your new class and test it. 

Example test description of your `XYPoint`
`The point is at (x: 5, y: 10)`

<details>
  <summary>Solution</summary> 
 
XYPoint.h 
```objective-c 
@interface XYPoint : NSObject
- (int)getX;
- (int)getY;
- (void)setXWithValue: (int)value;
- (void)setYWithValue: (int)value;
- (void)info;
@end
```

XYPoint.m
```objective-c 
#import <Foundation/Foundation.h>
#import "XYPoint.h"

// by using an internal @interface we create private properties
@interface XYPoint()
@property int x;
@property int y;
@end

@implementation XYPoint

- (int)getX {
  return  self.x;
}

- (int)getY {
  return self.y;
}

- (void)setXWithValue: (int)value {
  self.x = value;
}

- (void)setYWithValue: (int)value {
  self.y = value;
}

- (void)info {
  NSLog(@"The point is at (x: %i, y: %i)", self.x, self.y);
}

@end
```

main.m
```objective-c 
#import <Foundation/Foundation.h>
#import "XYPoint.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    XYPoint *point = [[XYPoint alloc] init];
    [point setXWithValue:5];
    [point setYWithValue:10];
    [point info]; // The point is at (x: 5, y: 10)
  }
  return 0;
}
```

</details> 

***

#### 4. Write a program that converts 27° from degrees Fahrenheit (F) to degrees Celcius (C) using the following formula: 
``` C = (F - 32) / 1.8 ```

```objective-c 
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // code here
  }
  return 0;
}
```

