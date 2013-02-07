//
//  DKTags.m
//  Overflow
//
//  Created by Dmitry Kurilo on 1/27/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import "DKTags.h"


const NSString *tagsApiUrl = @"https://api.stackexchange.com/2.0/tags?site=stackoverflow";
const NSString *tagsCacheFileName = @"DKTagsCache.cache";


@implementation DKTags

-(id)initWithDelegate:(id)delegate {
    if (self = [super init]) {
        [self setDelegate:delegate];
    }
    return self;
}

-(void)performLoadTags {
        [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(getTags) userInfo:nil repeats:NO];
}

// Check if DKTagsCache.cache exists
-(BOOL)cacheTagsExists {
    NSString *tempFolder = NSTemporaryDirectory();
    NSString *path = [tempFolder stringByAppendingString:(NSString*)tagsCacheFileName];
    return (BOOL)[[NSFileManager defaultManager] fileExistsAtPath:path];
}

-(void)getTags {
    if ([self cacheTagsExists]) {
        [self loadTagsFromSite:NO];
    } else {
        [self loadTagsFromSite:YES];
    }
}

-(void)loadTagsFromSite:(BOOL)flag {
    if (flag) {
        NSURL            *url        = [NSURL URLWithString:(NSString*)tagsApiUrl];
        NSURLRequest     *request    = [NSURLRequest requestWithURL:url];
        NSURLResponse    *gresponse   = nil;
        NSError          *gerror      = nil;
        NSOperationQueue *queue      = [[NSOperationQueue alloc] init];
        [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
            NSArray *arr = [data JSONValue][@"items"];
            [self saveCacheTags:arr];
            if ([_delegate respondsToSelector:@selector(takeTags:)]) {
                [_delegate takeTags:arr];
            }
        }];
    } else {
        NSString *fileName = (NSString*)tagsCacheFileName;
        NSString *homeDir = NSTemporaryDirectory();
        NSString *fullPath =[homeDir stringByAppendingPathComponent:fileName];
        NSMutableArray *datas = [[NSMutableArray alloc] initWithContentsOfFile:fullPath];
        if ([_delegate respondsToSelector:@selector(takeTags:)]) {
            [_delegate takeTags:datas];
        }
    }
}

-(void)saveCacheTags:(NSArray*)data {
    NSString *fileName = @"DKTagsCache.cache";
    NSString *homeDir = NSTemporaryDirectory();
    NSString *fullPath =[homeDir stringByAppendingPathComponent:fileName];
    [data writeToFile:fullPath atomically:YES];
}

@end
