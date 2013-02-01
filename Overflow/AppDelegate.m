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
    //_menu = [MenuFactory createStatusItem];
    //id<MenuActionsProtocol> menuActions = [[MenuActions alloc] initWithMenu:_menu];
    //[menuActions loadTags];
    
    NSBox *verticalSeparator = [[NSBox alloc] initWithFrame: NSMakeRect(236,0,1,100)];
    [verticalSeparator setBoxType:NSBoxCustom];
    [verticalSeparator setBorderColor:[NSColor grayColor]];
    self.window.titleBarHeight = 60.0;
    self.window.showsBaselineSeparator = NO;
    NSView *titleBarView = self.window.titleBarView;
    [titleBarView addSubview:verticalSeparator];
    
    NSTextField *title = [[NSTextField alloc] initWithFrame:NSMakeRect(100, 18, 100, 30)];
    [title setBordered:NO];
    [title setBezeled:NO];
    [title setEnabled:NO];
    [title setEditable:NO];
    [title setFont:[NSFont fontWithName:@"Lobster" size:20]];
    [title setDrawsBackground:NO];
    [title setTextColor:[NSColor grayColor]];
    [title setStringValue:@"Overflow"];
    [titleBarView addSubview:title];
    
#pragma mark refreshButton
    /*NSImage * tagPicture = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"refresh" ofType:@"png"]];
     NSImage * tagPicturePressed = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"refresh_pressed" ofType:@"png"]];
     [tagPicture setTemplate:YES];*/
    /*NSSize buttonSize = NSMakeSize(30.f, 30.f);
    NSRect buttonFrame = NSMakeRect(NSMidX(_leftList.bounds), NSMidY(titleBarView.bounds) - (buttonSize.height / 2.f), buttonSize.width, buttonSize.height);
    NSButton *button = [[NSButton alloc] initWithFrame:buttonFrame];
    [button setButtonType:NSMomentaryChangeButton];
    [button setImage:tagPicture];
    [button setImagePosition:NSImageOnly];
    [button setBordered:NO];
    [[button cell] setImageScaling:NSImageScaleProportionallyDown];
    [button setAlternateImage:tagPicturePressed];
    [titleBarView addSubview:button];*/
    
    
    
    
    
};

@end
