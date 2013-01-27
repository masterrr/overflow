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
    id<TagsProtocol> tags = [[DKTags alloc] init];
    NSLog(@"%@", [tags getTags]);
    _menu = [MenuFactory createStatusItem];

}

@end
