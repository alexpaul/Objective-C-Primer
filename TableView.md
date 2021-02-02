# UITableView Setup


## ViewController.h 

```objective-c 
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>
@end
```


## ViewController.m 


```objective-c 
#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *names;
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
