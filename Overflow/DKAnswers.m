//
//  DKAnswers.m
//  Overflow
//
//  Created by Dmitry Kurilo on 2/11/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "DKAnswers.h"
#import "SBJson.h"

const NSString *answersByTagApiUrl = @"http://api.stackoverflow.com/1.1/search?tagged=";
const NSString *answersCacheFileName = @"DKTagsCache.cache";

@implementation DKAnswers

-(id)initWithDelegate:(id)delegate {
    if (self = [super init]) {
        [self setDelegate:delegate];
    }
    return self;
}

-(void)getAnswersByName:(NSString*)name {
    NSString *path = [answersByTagApiUrl stringByAppendingString:name];
    NSLog(@"%@", path);
    NSURL            *url        = [NSURL URLWithString:(NSString*)path];
    NSURLRequest     *request    = [NSURLRequest requestWithURL:url];
    NSURLResponse    *gresponse   = nil;
    NSError          *gerror      = nil;
    NSOperationQueue *queue      = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        __strong NSArray *arr = [data JSONValue][@"questions"];
        if ([_delegate respondsToSelector:@selector(takeArray:)]) {
           
        }
    }];
}

@end
