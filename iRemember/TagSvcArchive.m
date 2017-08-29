//
//  TagSvcArchive.m
//  iRemember
//
//  Created by Jason Canney on 9/27/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//


// Implementation of TagSvcArchive.h
// Service layer methods to store Tag objects on the local file system of the device

#import "TagSvcArchive.h"

@implementation TagSvcArchive

// the location of the archive file
NSString *filePath;
// thelistofcontacts
NSMutableArray *tags = nil;

// an init method to initialize the service
- (id) init {
    NSArray *dirPaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    NSString *docsDir = [dirPaths objectAtIndex:0];
    filePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent: @"Tags.archive"]];
    
    [self readArchive];
    return self;
    
    /** if (self = [super init]){
        tags = [NSMutableArray array];
        return self;
    } **/
    // return nil;
}

//the ability to read the archive
- (NSMutableArray *) readArchive{
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:filePath]) {
        tags = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@"TagSvc.readArchive: %@", [tags description]);
        }
    else {
        tags = [NSMutableArray array];
    }
    return tags;
}

// the ability to write the archive

- (void) writeArchive{
    [NSKeyedArchiver archiveRootObject:tags toFile:filePath];
    NSLog(@"TagSvc.writeArchive: %@", [Tag description]);

}


- (Tag *) createTag:(Tag *)tag {
     NSLog(@"TagSvc.createTag: %@", [tag description]);
    
    [tags addObject:tag];
    [self writeArchive];
    
    return tag;
}

- (NSMutableArray *) retrieveAllTags{
    NSLog(@"TagSvc.retrieveAllTags: %@", [tags description]);
    // [self readArchive];
    return tags;
}

- (NSMutableArray *) retrieveAllTags2{
    NSLog(@"TagSvc.retrieveAllTags2: %@", [tags description]);
    tags = [self readArchive];
    return tags;
}



- (Tag *) updateTag:(Tag *)tag {
    return tag;
}

- (Tag *) deleteTag:(Tag *)tag{
    return tag; }


@end
