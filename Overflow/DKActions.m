//
//  DKActions.m
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "DKActions.h"

NSString *tagUrl = @"http://stackoverflow.com/questions/tagged/";

@implementation DKActions

-(void)openTagPagelWithName:(NSString*)string {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", tagUrl, string]]];
}
-(void)ping {
    NSLog(@"ping");
}

@end
