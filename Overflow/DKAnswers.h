//
//  DKAnswers.h
//  Overflow
//
//  Created by Dmitry Kurilo on 2/11/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKAnswers : NSObject

@property id delegate;
-(id)initWithDelegate:(id)delegate;
-(void)getAnswersByName:(NSString*)name;

@end
