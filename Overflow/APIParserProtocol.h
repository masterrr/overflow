//
//  SOParser.h
//  Overflow
//
//  Created by Dmitry Kurilo on 1/28/13.
//  Copyright (c) 2013 Kurilo Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIParserProtocol <NSObject>

@required
+(NSArray*)parseTags:(NSDictionary*)tagsObject

@end
