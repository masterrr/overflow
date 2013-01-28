//
//  GradientWindow.m
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "GradientWindow.h"

@implementation GradientWindow


- (void)drawRect:(NSRect)dirtyRect {
    NSGradient *gradient = [[NSGradient alloc]
                            initWithStartingColor:
                            [NSColor colorWithCalibratedRed:0.95 green:0.95 blue:0.95 alpha:1.0]
                            endingColor:
                            [NSColor colorWithSRGBRed:1 green:1 blue:1 alpha:1.0]];
    
    
    NSRect windowFrame = [self frame];
    [gradient drawInRect:windowFrame angle:90];
}

@end
