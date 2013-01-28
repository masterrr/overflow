//
//  AppDelegate.m
//  Overflow
//
//  Created by Dmitry Kurilo on 1/27/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _menu = [MenuFactory createStatusItem];
    id<MenuActionsProtocol> menuActions = [[MenuActions alloc] initWithMenu:_menu];
    [menuActions loadTags];
};

@end
