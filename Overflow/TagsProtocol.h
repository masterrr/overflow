//
//  TagsProtocol.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/27/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TagsProtocol <NSObject>

@required
    - (NSDictionary*)getTags;
    - (NSArray*)getTagsNames;
    - (NSArray*)getPrettyTagsNames;
@end
