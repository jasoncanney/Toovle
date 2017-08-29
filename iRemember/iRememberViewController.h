//
//  iRememberViewController.h
//  iRemember
//
//  Created by Jason Canney on 9/14/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//
//

#import <UIKit/UIKit.h>

// #import "iRememberFindController.h"

@interface iRememberViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *rfid;
@property (weak, nonatomic) IBOutlet UITextField *tagname;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)storeTag:(id)sender;

@end
