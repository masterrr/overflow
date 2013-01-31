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

@interface LeftListController : NSObject <PXSourceListDataSource, PXSourceListDelegate> {
    NSMutableArray *sourceListItems;
}
@property (strong) IBOutlet PXSourceList *leftlist;

@end
