//
//  SQLtests.m
//  iRemember
//
//  Created by Jason Canney on 10/5/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Tag.h"
#import "TagSvcSQLite.h"

@interface SQLtests : XCTestCase

@end

@implementation SQLtests

- (void) testTagSvcSQLite {
    NSLog(@" ");
    NSLog(@"*** Starting testTagSvcSQLite ***");
    
    // TODO: code for testing ContactSvcSQLite
    
    TagSvcSQLite *tagSvc = [[TagSvcSQLite alloc] init];
    Tag *tag = [[Tag alloc] init];
    tag.rfid = @"9876bb1ST";
    tag.tagname = @"Kidfast";
    [tagSvc createTag:tag];
    NSLog(@"*** Created Tag ***");
    NSLog(@" ");
    
    NSMutableArray *tags = [tagSvc retrieveAllTags];
    NSLog(@"*** number of tags: %lu", (unsigned long)tags.count);
    NSLog(@" ");

    tag.rfid = @"9876bb1ST";
    tag.tagname = @"Kidfaster";
    [tagSvc updateTag:tag];
    NSLog(@"*** Updated Tag 9876bb1ST ***");

    [tagSvc deleteTag:tag];
    NSLog(@"*** Deleted Tag 9876bb1ST ***");
    
    
    NSLog(@"*** Ending testTagSvcSQLite ***");
    NSLog(@" ");
}


@end
