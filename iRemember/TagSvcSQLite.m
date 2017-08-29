//
//  TagSvcSQLite.m
//  iRemember
//
//  Created by Jason Canney on 10/5/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//

#import "TagSvcSQLite.h"
#import "sqlite3.h"

// Implementation of TagSvcSQLite.h
// Service layer methods to store Tag objects to a SQLite3 database on the device
// Comment/Uncomment three lines in each Find and View controller .m files to change between Archive and SQL implementations


@implementation TagSvcSQLite

NSString *databasePath = nil;
sqlite3 *database = nil;

// initialize SQL database for usage

- (id) init {
    if ((self = [super init])) {
        
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        databasePath = [documentsDir stringByAppendingPathComponent:@"tag.sqlite3"];
        
        if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            NSLog(@"database is open");
            NSLog(@"database file path: %@", databasePath);
            // remove from here to the following if database issue fails
            NSString *createSql = @"create table if not exists tag (rfid varchar(30) primary key, tagname varchar(30))";
            
            char *errMsg;
            if (sqlite3_exec(database, [createSql UTF8String], NULL, NULL, &errMsg) != SQLITE_OK){
                NSLog(@"Failed to create table %s", errMsg);
            }
            // to here
        }
        else {
            
            NSLog(@"*** Failed to open database!");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
    }
    return self;
}

// createTag method
// returns: Tag

- (Tag *) createTag: (Tag *) tag {
    sqlite3_stmt *statement;
    NSString *insertSQL = [NSString stringWithFormat:
                           @"INSERT INTO tag (rfid, tagname) VALUES (\"%@\", \"%@\")",
                           tag.rfid, tag.tagname];
    if (sqlite3_prepare_v2(database,[insertSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            // contact.id = sqlite3_last_insert_rowid(database);
            NSLog(@"*** Tag added");
        } else {
            NSLog(@"*** Tag NOT added");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return tag;
}

// retrieveAllTags - Used by ViewController
// returns: Array of tags

- (NSMutableArray *) retrieveAllTags {
    NSMutableArray *tags = [NSMutableArray array];
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT * FROM tag ORDER BY rfid"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"*** Tags retrieved - retrieveAllTags");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            // int id = sqlite3_column_int(statement, 0);
            char *rfidChars = (char *)sqlite3_column_text(statement, 0);
            char *tagnameChars = (char *)sqlite3_column_text(statement, 1);
            
            Tag *tag = [[Tag alloc] init];
            // contact.id = id;
            tag.rfid = [[NSString alloc] initWithUTF8String:rfidChars];
            tag.tagname = [[NSString alloc] initWithUTF8String:tagnameChars];
            [tags addObject:tag];
        }
        sqlite3_finalize(statement);
    } else {
        NSLog(@"*** Tags NOT retrieved (retrieveAllTags)");
        NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
    }
    return tags;
}

// retrieveAllTags - Used by FindController
// returns: Array of tags

- (NSMutableArray *) retrieveAllTags2 {
    NSMutableArray *tags = [NSMutableArray array];
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT * FROM tag ORDER BY rfid"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"*** Tags retrieved - retrieveAllTags2");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            // int id = sqlite3_column_int(statement, 0);
            char *rfidChars = (char *)sqlite3_column_text(statement, 0);
            char *tagnameChars = (char *)sqlite3_column_text(statement, 1);
            
            Tag *tag = [[Tag alloc] init];
            // contact.id = id;
            tag.rfid = [[NSString alloc] initWithUTF8String:rfidChars];
            tag.tagname = [[NSString alloc] initWithUTF8String:tagnameChars];
            [tags addObject:tag];
        }
        sqlite3_finalize(statement);
    } else {
        NSLog(@"*** Tags NOT retrieved (retrieveAllTags2)");
        NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
    }
    return tags;
}

// updateTag - used to update a particular Tag domain object
// returns: single Tag


- (Tag *)updateTag:(Tag *)tag {
    NSString *updateSQL = [NSString stringWithFormat:
                           @"UPDATE tag SET rfid=\"%@\", tagname=\"%@\" WHERE rfid = %@ ",
                           tag.rfid, tag.tagname, tag.rfid];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) == SQLITE_OK){
        if (sqlite3_step(statement) ==SQLITE_DONE) {
            NSLog(@"*** Tag updated");
        } else{
            NSLog (@"*** Tag NOT updated");
            NSLog (@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return tag;
}

// deleteTag - removes SQL tag from database
// returns: single Tag

- (Tag *) deleteTag: (Tag *) tag {
    NSString *deleteSQL = [NSString stringWithFormat:
                           @"DELETE FROM tag WHERE rfid = %@", tag.rfid];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [deleteSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** Tag deleted");
            
        } else {
            NSLog (@"*** Tag NOT deleted");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    
    return tag;
}

// close the database

-(void)dealloc {
    sqlite3_close(database);
}

@end
