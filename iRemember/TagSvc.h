//
//  TagSvc.h
//  iRemember
//
//  Created by Jason Canney on 9/14/14.
//  Copyright (c) 2014 TooVle. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Tag.h"

// Interface used by service and business layer objects to use to utilize Tag objects

@protocol TagSvc <NSObject>

- (Tag *) createTag: (Tag *) tag;
- (NSMutableArray *) retrieveAllTags;
- (NSMutableArray *) retrieveAllTags2;
- (Tag *) updateTag: (Tag *) tag;
- (Tag *) deleteTag: (Tag *) tag;


@end
