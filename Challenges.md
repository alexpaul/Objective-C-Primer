# Challenges 

## Question 1
Write a program that subtracts the value 15 from 87 and displays the result, together with an appropriate message. 

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
    NSLog(@"The result of subtracting 15 from 87 is %i.", result);
    // The result of subtracting 15 from 87 is 72.
  }
  return 0;
}
```

</details> 

***

## Question 2
Create an object you use e.g  a `Car` and write five actions (methods) you perform on that object. 

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

## Question 3
Define a class caleed `XYPoint` that will hold a Cartesian coordinate `(x, y)`, where `x` and `y` are integers. Define methods to individually set `x` and `y` coordinates of a point and retrieve their values. Write an Objective-C program to implement your new class and test it. 

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

## Question 4
Write a C-style function that converts a given temperature in Fahrenheit (F) to degrees Celcius (C) using the following formula: 
``` C = (F - 32) / 1.8 ```

```Sample output```   
```36° Fahrenheit is 2° Celcius.```

```objective-c 

// declare C-style function here 
// code here

// example of a C-style function
/*
int add(int nun1, int num2) {
  return num1 + num2; 
}*/

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
int convert(int fahrenheit) {
  return (fahrenheit - 32) / 1.8;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    int celcius = convert(36);
    NSLog(@"36° Fahrenheit is %i° Celcius.", celcius); // 36° Fahrenheit is 2° Celcius
  }
  return 0;
}
```

</details> 

***

## Question 5
Write a program that calculates the sum of the digits of an integer. For example, the sum of the digits of the number 3045 is 3 + 0 + 4 + 5, or 12. 

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
    int number = 3045;
    int sum = 0;
    while(number > 0) {
      sum += number % 10;
      number /= 10;
    }
    NSLog(@"The sum is %i", sum); // The sum is 12
  }
  return 0;
}
```

</details> 

***

## Question 6 

Write a function (C-style) that takes two integers and returns a boolean value indicating whether or NOT the first number is divisible by the second number. Use an if/else statement to print an appropriate message. 

```objective-c
// code function here

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // code solution here
  }
  return 0;
}
```

<details>
  <summary>Solution</summary> 
  
```objective-c 
bool isDivible(int number, int divisor) {
  return number % divisor == 0;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    int number = 15;
    int divisor = 3;
    bool result = isDivible(number, divisor);
    if (result) {
      NSLog(@"%i is divisible by %i.", number, divisor);
    } else {
      NSLog(@"%i is NOT divisible by %i.", number, divisor);
    }
  }
  return 0;
}
```

</details> 

***


