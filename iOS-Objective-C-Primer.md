# iOS Objective-C Primer

## ViewController

#### ViewController.h

Here the ViewController is importing UIKit and subclassing from UIViewController, pay attention to the Objective-C syntax here as opposed to Swift. 

```objective-c
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end
```

#### ViewController.m

The code within the @interface block in the ViewController.m implementation file here will be private to outside classes. This is a great example of encapsulation in Object Oriented Programming. Internal implementations only specific to this class remains private. 

```objective-c 
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}


@end
```
