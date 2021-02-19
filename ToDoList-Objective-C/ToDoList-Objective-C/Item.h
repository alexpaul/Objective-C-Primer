//
//  Item.h
//  ToDoList-Objective-C
//
//  Created by Alex Paul on 2/18/21.
//

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
