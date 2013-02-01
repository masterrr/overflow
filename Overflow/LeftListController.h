//
//  LeftListController.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/31/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXSourceList.h"
#import "SourceListItem.h"
#import "DKTags.h"
#import "APITagsProtocol.h"

@interface LeftListController : NSObject <PXSourceListDataSource, PXSourceListDelegate, APITagsProtocol> {
    NSMutableArray *sourceListItems;
}
@property BOOL isLoading;
@property (strong) IBOutlet NSProgressIndicator *progressLeftIndicator;
@property (strong) IBOutlet PXSourceList *leftlist;
@property (strong) SourceListItem *tags;
-(void)refreshTags;

@end
