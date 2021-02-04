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

Topics: basic variables

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

Topics: basic variables, class, methods 

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

Topics: basic variables, class, methods 

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

Topics: basic variables, class, methods 

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

Topics: basic variables, loops 

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
    BOOL result = isDivible(number, divisor);
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

Topics: basic variables, functions 

***

## Question 7 
Write a class called `GraphicObject` with the following properties: `fillColor`, `filled`, `lineColor`, `width` and `height`. Write a class called `Rectangle` that inhertis from the `GraphicObject` class. Implement and test the following methods `area` and `perimeter` on the `Rectangle` class. 

Expected input for the Rectangle class:   
`width: 100`  
`height: 40`  

Expected output: 
`Rectangle area is 4000 and the perimeter is 280`  

<details>
  <summary>Solution</summary> 

GraphicObject.h 
```objective-c 
@interface GraphicObject : NSObject

{
  int fillColor; // 32-bit color
  BOOL filled; // is the object filled?
  int lineColor; // 32-bit line color
  int width; // width of the object
  int height; // height of the object
}

@property int fillColor, lineColor, width, height; 
@property BOOL filled;

@end
```

GraphicObject.m
```objective-c 
#import <Foundation/Foundation.h>
#import "GraphicObject.h"

@implementation GraphicObject

@synthesize fillColor, filled, lineColor, width, height; 

@end
```

Rectangle.h
```objective-c 
#import "GraphicObject.h"

@interface Rectangle : GraphicObject

- (int)perimeter;
- (int)area;
@end
```

Rectangle.m
```objective-c 
#import <Foundation/Foundation.h>
#import "Rectangle.h"

@implementation Rectangle

- (int)perimeter {
  return (width * 2) + (height * 2);
}

- (int)area {
  return width * height;
}
@end
```

main.m
```objective-c 
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Rectangle *rect = [[Rectangle alloc] init];
    [rect setFillColor: 12];
    
    NSLog(@"rect fill color is %i", rect.fillColor);
    
    [rect setWidth: 100];
    [rect setHeight: 40];
    
    int area = [rect area];
    int perimeter = [rect perimeter];
    
    NSLog(@"Rectangle area is %i and the perimeter is %i", area, perimeter);
    // Rectangle area is 4000 and the perimeter is 280
  }
  return 0;
}
```
</details> 

Topics: basic variables, class, methods, properties, inheritance

***


## Question 8 

Using the Recatangle class from earlier add an initializer method according to the following declaration and test it.   

```objective-c
- (instancetype)initWithWidth: (int) width andHeight: (int) height;
```

Test 

```objective-c 
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Rectangle *rect = [[Rectangle alloc] initWithWidth:10 andHeight:5];
    int area = [rect area];
    int perimeter = [rect perimeter];
    NSLog(@"The area of the rectangle is %i and the perimeter is %i", area, perimeter);
    // The area of the rectangle is 50 and the perimeter is 30
  }
  return 0;
}
```

<details>
  <summary>Solution</summary> 

Rectangle.h 
```objective-c 
- (instancetype)initWithWidth: (int) width andHeight: (int) height;
```

Rectangle.m
```objective-c 
- (instancetype)initWithWidth: (int) width andHeight: (int) height {
  self = [super init];
  if (self) {
    self.width = width; 
    self.height = height;
  }
  return self;
}
```

main.m
```objective-c 
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Rectangle *rect = [[Rectangle alloc] initWithWidth:10 andHeight:5];
    int area = [rect area];
    int perimeter = [rect perimeter];
    NSLog(@"The area of the rectangle is %i and the perimeter is %i", area, perimeter);
    // The area of the rectangle is 50 and the perimeter is 30
  }
  return 0;
}
```

</details> 

***

