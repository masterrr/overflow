//
//  AppDelegate.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/27/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DKTags.h"
#import "TagsProtocol.h"
#import "MenuFactory.h"
#import "MenuActions.h"
#import "GradientWindow.h"
#import "INAppStoreWindow.h"
#import "PXSourceList.h"
#import "LeftListController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet INAppStoreWindow *window;
@property (strong) NSMenuItem *menu;

@end
