//
//  MenuActions.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuActionsProtocol.h"

@interface MenuActions : NSObject <MenuActionsProtocol> {
    NSMenuItem *dmenu;
}

-(id)initWithMenu:(NSMenuItem*)menu;


@end
