//
//  iRememberViewController.m
//  iRemember
//
//  Created by Jason Canney on 9/14/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//
//

#import "iRememberViewController.h"

#import "Tag.h"
// #import "TagSvcArchive.h"
#import "TagSvcSQLite.h"


@interface iRememberViewController ()

@end

@implementation iRememberViewController

//TagSvcArchive *tagSvc = nil;
TagSvcSQLite *tagSvc = nil;


- (void)viewDidLoad
{
    [super viewDidLoad];
    //tagSvc = [[TagSvcArchive alloc] init];
    tagSvc = [[TagSvcSQLite alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[tagSvc retrieveAllTags] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem"; UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Tag *tag = [[tagSvc retrieveAllTags]
            objectAtIndex:indexPath.row]; cell.textLabel.text = [tag description];
    return cell;
}

- (IBAction)storeTag:(id)sender {
    
    [self.view endEditing:YES];
    
    NSLog(@"storeTag: entering");
    Tag *tag = [[Tag alloc] init];
    tag.rfid = _rfid.text;
    tag.tagname = _tagname.text;
    [tagSvc createTag:tag];
    [self.tableView reloadData];
    NSLog(@"storeTag: tag saved");
}

- (IBAction)deleteTag:(id)sender {
    [self.view endEditing:YES];
    
    NSLog(@"deleteTag");
}

@end
