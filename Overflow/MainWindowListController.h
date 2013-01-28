//
//  MainWindowListController.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXSourceListDataSource.h"
#import "PXSourceListDelegate.h"

@interface MainWindowListController : NSObject <PXSourceListDataSource, PXSourceListDelegate>

@end
