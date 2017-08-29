//
//  iRememberFindController.h
//  iRemember
//
//  Created by Jason Canney on 9/21/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//
//

#import <UIKit/UIKit.h>

// @class iRememberViewController;

@interface iRememberFindController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
