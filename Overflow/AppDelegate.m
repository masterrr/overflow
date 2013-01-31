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
    //id<MenuActionsProtocol> menuActions = [[MenuActions alloc] initWithMenu:_menu];
    //[menuActions loadTags];
    self.window.titleBarHeight = 60.0;
    NSView *titleBarView = self.window.titleBarView;
    NSSize buttonSize = NSMakeSize(100.f, 30.f);
    NSRect buttonFrame = NSMakeRect(NSMidX(titleBarView.bounds) - (buttonSize.width / 2.f), NSMidY(titleBarView.bounds) - (buttonSize.height / 2.f), buttonSize.width, buttonSize.height);
    NSButton *button = [[NSButton alloc] initWithFrame:buttonFrame];
    [button setBezelStyle:NSShadowlessSquareBezelStyle];
    [button setTitle:@"A Button"];
    [titleBarView addSubview:button];
    
    
    
    
};

@end
