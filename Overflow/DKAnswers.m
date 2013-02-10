//
//  DKAnswers.m
//  Overflow
//
//  Created by Dmitry Kurilo on 2/11/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "DKAnswers.h"

const NSString *tagsApiUrl = @"https://api.stackexchange.com/2.1/tags?order=desc&sort=popular&site=stackoverflow";
const NSString *answersCacheFileName = @"DKTagsCache.cache";

@implementation DKAnswers

-(id)initWithDelegate:(id)delegate {
    if (self = [super init]) {
        [self setDelegate:delegate];
    }
    return self;
}

-(void)getAnswersByName:(NSString*)name {
    
}

@end
