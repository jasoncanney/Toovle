//
//  iRememberTests.m
//  iRememberTests
//
//  Created by Jason Canney on 9/14/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Tag.h"
#import "TagSvcArchive.h"

@interface iRememberTests : XCTestCase

@end

@implementation iRememberTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTagSvcArchive
{
    NSLog(@"*** Starting testTagSvcArchive ***");
    TagSvcArchive *tagSvc = [[TagSvcArchive alloc] init];
    
    Tag *tag = [[Tag alloc] init];
    Tag *tags = [[Tag alloc] init];
    tag.rfid = @"1234asdfa2334";
    tag.tagname = @"Gracie's Tag3";
    [tagSvc createTag:(Tag *) tag];
    tags.rfid = @"123ffff2334";
    tags.tagname = @"Gracie's Tag1";
    [tagSvc createTag:(Tag *) tags];
    
    
    // [tagSvc readArchive:(Tag *) tags];
    
    NSMutableArray *tags2 = nil;
    tags2 = [tagSvc retrieveAllTags2];
    long count = [[tagSvc retrieveAllTags2] count];

    // int initialCount = nil;
    
    // STAssertEquals(initialCount +1, count, @"initial count %@, count %@", initialCount, count);
    
    NSLog(@"*** The count: %li", count);
    NSLog(@"*** Ending testTagSvcArchive ***");
}



@end
