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
        NSMenuItem *item = [self prepareMenu:@"Ask Question"];
        [item setRepresentedObject:self];
        [item setTarget:self];
        [item setAction:@selector(quickAsk)];
    }
    return self;
}

-(void)quickAsk {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://stackoverflow.com/questions/ask"]];
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

-(void)openTagsPage:(NSMenuItem*)sender {
    NSString *tagname = [sender title];
    NSArray *arr = [tagname componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    tagname = [arr objectAtIndex:0];
    NSString *openUrl = [[NSString alloc] initWithFormat:@"%@%@", @"http://stackoverflow.com/questions/tagged/", tagname];
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:openUrl]];
}

-(void)loadTags {
    NSMenuItem *tagsmenu = [self prepareMenu:@"Tags"];
    id<TagsProtocol> tags = [[DKTags alloc] init];
    NSDictionary *tags_node = [tags getTags];
    NSMenu *submenu = [MenuFactory createMenu];
    [tagsmenu setSubmenu:submenu];
    for (id obj in tags_node) {
        NSLog(@"%@", obj);
        NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:[obj objectForKey:@"name"]];
        NSString * countraw = [[NSString alloc] initWithFormat:@" (%@)", [obj objectForKey:@"count"]];
        NSMutableAttributedString * count = [[NSMutableAttributedString alloc] initWithString:countraw];
        [count addAttribute:NSForegroundColorAttributeName value:[NSColor grayColor] range:NSMakeRange(0, [count length])];
        [string appendAttributedString:count];
        NSMenuItem *menuitem = [MenuFactory createMenuItemWithName:@""];
        [menuitem setAttributedTitle:string];
        [menuitem setRepresentedObject:self];
        [menuitem setTarget:self];
        [menuitem setAction:@selector(openTagsPage:)];
        [submenu addItem:menuitem];

    }    
}

@end
