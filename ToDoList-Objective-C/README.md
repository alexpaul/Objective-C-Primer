# To do list app - Objective-C 

![to do list app](https://github.com/alexpaul/To-Do-List-Objective-C-Advance/blob/main/Assets/to-do-list-app.gif)

## [Video - Part 3](https://youtu.be/IJ28qjvRKo0)

## 1. Configure the app hierarchy programmatically in the `SceneDelegate.m`

```objective-c
// configure our app to be embedded in a navigation controller
// 1. setup window
CGRect bounds = [UIScreen mainScreen].bounds;
_window = [[UIWindow alloc] initWithFrame: bounds];
_window.windowScene = (UIWindowScene *)scene;

// 2. get an instance of the "Main" storyboard
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];


// 3. get an instance of the "ItemsViewController" from storyboard
ItemsViewController *itemsVC = [storyboard instantiateViewControllerWithIdentifier:@"ItemsViewController"];


// 4. declare a navigation controller
UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:itemsVC];

// 5. set the window's root view controller
[_window setRootViewController: navController];

[_window makeKeyAndVisible];
```

## 2. Item.h 

```objective-c
@interface Item : NSObject

// properties
@property NSString *name; // Study linked list
@property NSString *topic; // DSA

// initializer
// Item *item = [[Item alloc] init];
// item.name =
// item.topic =
// Item *item = [[Item alloc] initWithName: @"" topic: @""];
- (instancetype)initWithName: (NSString *)name andTopic: (NSString *)topic;

// methods
+ (NSArray *)fetchItems; // [Item fetchItems]; // returns an array of items

@end
```

## 3. Item.m 

```objective-c
#import <Foundation/Foundation.h>
#import "Item.h"

@implementation Item

- (instancetype)initWithName:(NSString *)name andTopic:(NSString *)topic {
  if (self = [super init]) {
    // initialize all properties here....
    self.name = name;
    self.topic = topic;
  }
  return self;
}

+ (NSArray *)fetchItems {
  return @[
    [[Item alloc] initWithName:@"Coffee with Facebook Engineer" andTopic:@"Informational Interview"],
    [[Item alloc] initWithName:@"Phone interview with Snap" andTopic:@"2nd Interview"],
    [[Item alloc] initWithName:@"Review Hash Tables" andTopic:@"DSA"],
    [[Item alloc] initWithName:@"Push app to TestFlight" andTopic:@"iOS app development"],
    [[Item alloc] initWithName:@"Update README for Capstone project" andTopic:@"Github"]
  ];
}

@end
```

## 4. ItemsViewController.h 

```objective-c
#import <UIKit/UIKit.h>

@interface ItemsViewController : UIViewController
@end
```

## 5. ItemsViewController.m 

```objective-c
#import "ItemsViewController.h"
#import "Item.h"

// conform to UITableViewDataSource
@interface ItemsViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *items;
@end

@implementation ItemsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  [self configureNavBar];
  
  // table view's data
  self.items = [[NSMutableArray alloc]
                initWithArray:[Item fetchItems]];
  
  self.tableView.dataSource = self;
}

- (void)configureNavBar {
  // 1. create an image for the bar button item
  UIImage *image = [UIImage systemImageNamed:@"plus"];
  
  // 2. create bar button item
  UIBarButtonItem *plusButton = [[UIBarButtonItem alloc] initWithImage:image  style:UIBarButtonItemStylePlain target: self action:@selector(addItem)];
  
  // 3. set the "plusButton" as the right bar button item
  self.navigationItem.rightBarButtonItem = plusButton;
  
  self.navigationItem.title = @"To do list";
  self.navigationController.navigationBar.prefersLargeTitles = true;
}

- (void)addItem {
  
  // 1. initialize an alert controller
  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add a new to do list item" message:@"" preferredStyle:UIAlertControllerStyleAlert];
  
  // 2. add two text fields to the alert controller
  [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    // code here
  }];
  
  [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    // code here
  }];
  
  // 3. add placeholder text to the text fields
  alertController.textFields[0].placeholder = @"Enter the name of the item";
  alertController.textFields[1].placeholder = @"Enter the topic";
  
  // 4. define action items "Cancel" and "Save"
  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    // handler code here
  }];
  
  UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    // handler code here
    // 1. insert the new item
    NSString *name = alertController.textFields[0].text;
    NSString *topic = alertController.textFields[1].text;
    Item *newItem = [[Item alloc] initWithName:name andTopic:topic];
    [self.items addObject:newItem];

    // 2. create an indexpath a the end of items array
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.items.count - 1 inSection:0];
    
    // 3. insert indexpath into table view
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
  }];
  
  // 5. add actions to the alert controller
  [alertController addAction:cancelAction];
  [alertController addAction:saveAction];
  
  [self presentViewController:alertController animated:true completion:nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
  Item *item = self.items[indexPath.row];
  cell.textLabel.text = item.name;
  cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  cell.detailTextLabel.text = item.topic;
  cell.detailTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  return cell;
}

@end
```


