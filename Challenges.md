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

#### 3. Define a class caleed `XYPoint` that will hold a Cartesian coordinate `(x, y)`, where `x` and `y` are integers. Define methods to individually set `` and `` coordinates of a point and retrieve their values. Write an Objective-C program to implement your new class and test it. 

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

