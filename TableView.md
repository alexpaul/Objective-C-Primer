# UITableView Setup


## ViewController.h 

In the header file we conform to the `UITableViewDataSource` protocol. 

```objective-c 
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>
@end
```


## ViewController.m 

In the implementation file we implement the required (2) methods of the `UITableViewDataSource`. 

```objective-c 
#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *names; // names will be the data for the table view
@end

@implementation ViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.dataSource = self;
  self.names = [[NSMutableArray alloc] initWithArray:@[@"C", @"Objective-C", @"C#", @"Java", @"Swift"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
  NSString *name = self.names[indexPath.row];
  cell.textLabel.text = name;
  return cell;
}
@end
```
