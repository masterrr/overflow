//
//  MenuActions.m
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "MenuActions.h"
#import "MenuFactory.h"
#import "DKTags.h"

@implementation MenuActions

-(id)initWithMenu:(NSMenuItem*)menu {
    if (self = [super init]) {
        dmenu = menu;
    }
    return self;
}

-(BOOL)checkIfMenuExists:(NSString*)str {
    NSArray *items = dmenu.menu.itemArray;
    for (id obj in items) {
        if ([[obj title] isEqualToString:str]) {
            return YES;
        }
    }
    return NO;
}

-(NSMenuItem*)getMenu:(NSString*)str {
    NSArray *items = dmenu.menu.itemArray;
    for (id obj in items) {
        if ([[obj title] isEqualToString:str]) {
            return obj;
        }
    }
    return NO;
}

-(NSMenuItem*)prepareMenu:(NSString*)menuname {
    NSMenuItem *item;
    if (![self checkIfMenuExists:menuname]) {
        item = [MenuFactory createMenuItemWithName:menuname];
        [[dmenu menu] addItem:item];
    } else {
        item = [self getMenu:menuname];
    }
    return item;
}

-(void)loadTags {
    id<TagsProtocol> tags = [[DKTags alloc] init];
    NSArray *names = [tags getPrettyTagsNames];
    NSMenuItem *tagsmenu = [self prepareMenu:@"Tags"];
    NSMenu *submenu = [MenuFactory createMenu];
    [tagsmenu setSubmenu:submenu];
    for (id obj in names) {
        NSLog(@"%@", obj);
        [submenu addItem:[MenuFactory createMenuItemWithName:obj]];
    } 
}

@end
