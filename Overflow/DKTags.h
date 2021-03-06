//
//  DKTags.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/27/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DKTagsProtocol.h"
#import "APITagsProtocol.h"
#import "SBJson.h"

@interface DKTags : NSObject <DKTagsProtocol>

@property (strong) NSArray *gdata;
@property id delegate;
-(void)processTags;

@end
