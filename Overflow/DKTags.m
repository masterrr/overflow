//
//  DKTags.m
//  Overflow
//
//  Created by Dmitry Kurilo on 1/27/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "DKTags.h"


const NSString *tagsApiUrl = @"https://api.stackexchange.com/2.0/tags?site=stackoverflow";



@implementation DKTags

-(id)initWithDelegate:(id)delegate {
    if (self = [super init]) {
        [self setDelegate:delegate];
    }
    return self;
}

-(void)performLoadTags {
    [self getTags];
}

-(void)getTags {
    NSURL            *url        = [NSURL URLWithString:(NSString*)tagsApiUrl];
    NSURLRequest     *request    = [NSURLRequest requestWithURL:url];
    NSURLResponse    *gresponse   = nil;
    NSError          *gerror      = nil;
    NSOperationQueue *queue      = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        self.gdata = data;
        [gresponse setValue:response];
        [gerror setValue:error];
        [self processTags];
    }];
}

-(void)processTags {
    NSMutableDictionary *dict;
    if (!_gdata) {
        // TODO Error
    } else {
        NSString *dataString = [[NSString alloc] initWithData:_gdata encoding:NSUTF8StringEncoding];
        dict = [dataString JSONValue][@"items"];
    }
    if ([_delegate respondsToSelector:@selector(takeTags:)]) {
        [_delegate takeTags:dict];
    }
}


@end
