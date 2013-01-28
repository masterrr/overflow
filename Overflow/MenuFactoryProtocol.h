//
//  MenuFactoryProtocol.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuFactoryProtocol <NSObject>

+ (NSMenuItem*)createMenuItemWithName:(NSString*)name;
+ (NSMenuItem*)createStatusItem;
+ (NSMenu*)createMenu;

@end
