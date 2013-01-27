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
    [theItem setTitle: @"test"];
    return (NSMenuItem*)theItem;
}

+ (NSMenu*)createMenu {
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"yup"];
    NSMenuItem *newMenu = [[NSMenuItem alloc] initWithTitle:@"Overflow" action:NULL keyEquivalent:@""];
    [menu addItem:newMenu];
    return menu;
}

@end
