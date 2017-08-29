//
//  Tag.m
//  iRemember
//
//  Created by Jason Canney on 9/14/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//


// domain layer implementation methods for Tag domain object

#import "Tag.h"

static NSString * const RFID = @"rfid";
static NSString * const TAGNAME = @"tagname";

@implementation Tag


// setter method

- (void)encodeWithCoder:(NSCoder *)code {
    [code encodeObject:self.rfid forKey:RFID];
    [code encodeObject:self.tagname forKey:TAGNAME];
}

// getter method

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self){
        _rfid = [coder decodeObjectForKey:RFID];
        _tagname = [coder decodeObjectForKey:TAGNAME];
    }
    return self;
}

// description method used for various reporting and error handling

- (NSString *) description {
    return [NSString stringWithFormat: @"%@ %@",
            _rfid, _tagname];
}
@end
