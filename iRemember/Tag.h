//
//  Tag.h
//  iRemember
//
//  Created by Jason Canney on 9/14/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//


// Domain layer object header file for Tag domain objects

#import <Foundation/Foundation.h>

@interface Tag : NSObject <NSCoding>

// domain values rfid and tagname
@property (nonatomic, strong) NSString *rfid;
@property (nonatomic, strong) NSString *tagname;

@end
