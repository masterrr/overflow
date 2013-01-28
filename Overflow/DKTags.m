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

-(NSDictionary*)getTags {
    NSMutableDictionary *dict;
    
    NSURL           *url        = [NSURL URLWithString:(NSString*)tagsApiUrl];
    NSURLRequest    *request    = [NSURLRequest requestWithURL:url];
    NSURLResponse   *response   = nil;
    NSError         *error      = nil;
    NSData          *data       = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (!data) {
        // TODO Error
    } else {
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        dict = [dataString JSONValue][@"items"];
    }
    return dict;
}


-(NSArray*)getTagsArray {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSDictionary *dict = [self getTags];
    for (id obj in dict) {
        [arr addObject:obj];
    }
    return arr;
}


@end
