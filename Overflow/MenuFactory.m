//
//  MenuFactory.m
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "MenuFactory.h"

@implementation MenuFactory

+ (NSMenuItem*)createStatusItem {
    NSStatusBar *bar = [NSStatusBar systemStatusBar];
    NSStatusItem *theItem = [bar statusItemWithLength:NSVariableStatusItemLength];
    [theItem setEnabled:YES];
    [theItem setMenu:[self createMenu]];
    [theItem setTitle: @"OF"];
    return (NSMenuItem*)theItem;
}

+ (NSMenu*)createMenu {
    NSMenu *menu = [[NSMenu alloc] init];
    return menu;
}

+ (NSMenuItem*)createMenuItemWithName:(NSString*)name {
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:name action:NULL keyEquivalent:@""];
    return item;
}

@end
