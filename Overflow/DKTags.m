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
    NSLog(@"%@", dict);
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

-(NSArray*)getTagsNames {
    NSArray *arr = [[NSArray alloc] initWithArray:[self getTagsArray]];
    NSMutableArray *newarr = [[NSMutableArray alloc] init];
    for (id obj in arr) {
        [newarr addObject:(NSString*)[obj objectForKey:@"name"]];
    }
    return newarr;
}

-(NSArray*)getPrettyTagsNames {
    NSArray *arr = [[NSArray alloc] initWithArray:[self getTagsArray]];
    NSMutableArray *newarr = [[NSMutableArray alloc] init];
    for (id obj in arr) {
        NSString *string = [NSString stringWithFormat:@"%@ | %@", [obj objectForKey:@"name"], [obj objectForKey:@"count"]];
        [newarr addObject:string];
    }
    return newarr;
}

@end
