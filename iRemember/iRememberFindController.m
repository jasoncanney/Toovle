//
//  iRememberFindController.m
//  iRemember
//
//  Created by Jason Canney on 9/21/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//
//

#import "iRememberFindController.h"

#import "Tag.h"
// #import "TagSvcArchive.h"
#import "TagSvcSQLite.h"
#import "iRememberViewController.h"

@interface iRememberFindController ()

@end

@implementation iRememberFindController

// TagSvcArchive *tagSvc2 = nil;
TagSvcSQLite *tagSvc2 = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // tagSvc2 = [[TagSvcArchive alloc] init];
    tagSvc2 = [[TagSvcSQLite alloc] init];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[tagSvc2 retrieveAllTags2] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem"; UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Tag *tag = [[tagSvc2 retrieveAllTags2] objectAtIndex:indexPath.row]; cell.textLabel.text = [tag description];

    // Tag *tag = [[tagSvc2 retrieveAllTags]
    //           objectAtIndex:indexPath.row]; cell.textLabel.text = [tag description];
    return cell;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
