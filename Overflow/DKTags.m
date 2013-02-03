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
    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(getCacheTags) userInfo:nil repeats:NO];
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

-(void)saveCacheTags:(NSArray*)data {
    NSString *fileName = @"DKTagsCache.cache";
    NSString *homeDir = NSTemporaryDirectory();
    NSString *fullPath =[homeDir stringByAppendingPathComponent:fileName];
    [data writeToFile:fullPath atomically:YES];
}

-(void)getCacheTags {
    NSString *fileName = @"DKTagsCache.cache";
    NSString *homeDir = NSTemporaryDirectory();
    NSString *fullPath =[homeDir stringByAppendingPathComponent:fileName];
    NSMutableArray *datas = [[NSMutableArray alloc] initWithContentsOfFile:fullPath];
    if ([_delegate respondsToSelector:@selector(takeTags:)]) {
        [_delegate takeTags:datas];
    }
}

-(void)processTags {
    NSMutableArray *arr;
    if (!_gdata) {
        // TODO Error
    } else {
        NSString *dataString = [[NSString alloc] initWithData:_gdata encoding:NSUTF8StringEncoding];
        arr = [dataString JSONValue][@"items"];
        [self saveCacheTags:arr];
    }
    if ([_delegate respondsToSelector:@selector(takeTags:)]) {
        [_delegate takeTags:arr];
    }
}

@end
