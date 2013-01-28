//
//  AppDelegate.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/27/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PXSourceList.h"
#import "DKTags.h"
#import "TagsProtocol.h"
#import "MenuFactory.h"
#import "MenuActions.h"
#import "MainWindowListController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) NSMenuItem *menu;
@property (strong) IBOutlet PXSourceList *leftList;

@end
