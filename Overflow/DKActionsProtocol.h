//
//  DKActionsProtocol.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DKActionsProtocol <NSObject>

@required
-(void)openTagPagelWithName:(NSString*)string;
-(void)ping;
@end
