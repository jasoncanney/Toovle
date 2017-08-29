//
//  TagSvcSQLite.h
//  iRemember
//
//  Created by Jason Canney on 10/5/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TagSvc.h"

// Interface of TagSvcSQLite.h
// Service layer methods to store Tag objects to a SQLite3 database on the device
// Comment/Uncomment three lines in each Find and View controller .m files to change between Archive and SQL implementations


@interface TagSvcSQLite : NSObject <TagSvc>

@end
