# To do list app - Objective-C 

![to do list app](https://github.com/alexpaul/To-Do-List-Objective-C-Advance/blob/main/Assets/to-do-list-app.gif)

## 1. Configure the app hierarchy programmatically in the `SceneDelegate.m`

```objective-c
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
_window.windowScene = (UIWindowScene *)scene;

ItemsViewController *itemsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ItemsViewController"];
UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController: itemsViewController];

[_window setRootViewController: navController];
[_window makeKeyAndVisible];
```

## 2. Item.h 

```objective-c
@interface Item : NSObject

@property NSString *name;
@property NSString *topic;

+ (NSArray *)fetchItems;

- (instancetype)initWithName: (NSString *) name andTopic: (NSString *) topic; 

@end
```

## 3. Item.m 

```objective-c
#import <Foundation/Foundation.h>

#import "Item.h"

@implementation Item

+ (NSArray *)fetchItems {
  return @[[[Item alloc] initWithName:@"Coffee with Facebook Engineer" andTopic:@"Informational Interview"],
           [[Item alloc] initWithName:@"Phone interview with Snap" andTopic:@"2nd Interview"],
           [[Item alloc] initWithName:@"Review Hash Tables" andTopic:@"DSA"],
           [[Item alloc] initWithName:@"Push app to TestFlight" andTopic:@"iOS app"],
           [[Item alloc] initWithName:@"Update README for Capstone project" andTopic:@"Github"]
  ];
}

- (instancetype)initWithName:(NSString *)name andTopic:(NSString *)topic {
  if (self = [super init]) {
    self.name = name;
    self.topic = topic;
  }
  return self;
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

@interface ItemsViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *items;
@end

@implementation ItemsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor: UIColor.systemTealColor];
  self.navigationItem.title = @"To do list";
  [self configureNavBar];
  self.tableView.dataSource = self;
  self.items = [[NSMutableArray alloc] initWithArray: [Item fetchItems]];
}

- (void)configureNavBar {
  UIImage *image = [UIImage systemImageNamed:@"plus"];
  UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target: self action:@selector(addContact)];
  self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)addContact {
  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add a new to do list item" message:@"" preferredStyle:UIAlertControllerStyleAlert];
  
  [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
      
  }];
  
  [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
      
  }];
  
  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    // action handler code here
    NSLog(@"%@", alertController.textFields[0].text);
    
    NSString *name = alertController.textFields[0].text;
    NSString *topic = alertController.textFields[1].text;
    
    Item *newItem = [[Item alloc] initWithName:name andTopic:topic];

    [self.items addObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: self.items.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
  }];
  
  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle: @"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    
  }];
  
  alertController.textFields[0].placeholder = @"Enter the name of the to do item";
  alertController.textFields[1].placeholder = @"Enter the topic";
  
  [alertController addAction: okAction];
  
  [alertController addAction:cancelAction];
  
  [self presentViewController:alertController animated:true completion:nil];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
  Item *item = self.items[indexPath.row];
  cell.textLabel.text = item.name;
  cell.detailTextLabel.text = item.topic;
  return cell;
}

@end
```


