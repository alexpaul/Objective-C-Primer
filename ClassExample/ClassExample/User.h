//
//  User.h
//  ClassExample
//
//  Created by Alex Paul on 8/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//


@interface User : NSObject

// Properties
@property (copy) NSString *username;

// Methods: instance and class methods
// class methods are prefixed with a +
// instance is prefixed with a -
- (void)userInfo;

// Initializers

@end
