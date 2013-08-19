//
//  WMVideo.m
//  WeMake
//
//  Created by Michael Scaria on 8/1/13.
//  Copyright (c) 2013 michaelscaria. All rights reserved.
//

#import "WMVideo.h"
#import "WMCreator.h"

@implementation WMVideo

+ (NSArray *)videosWithArray:(NSArray *)videosArray {
    NSMutableArray *videos = [NSMutableArray arrayWithCapacity:videosArray.count];
    for (NSDictionary *dictionary in videosArray) {
        WMVideo *video = [[self alloc] initWithDictionary:dictionary];
        [videos addObject:video];
    }
    return [videos copy];
}

+ (id)videoWithDictionary:(NSDictionary *)videoDictionary {
    WMVideo *video = [[self alloc] initWithDictionary:videoDictionary];
    return video;
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if ((self = [super init])) {
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
            if ([key isEqualToString:@"id"]) {
                _theID = [value intValue];
            }
            else if ([key isEqualToString:@"url"]) {
                _url = value;
            }
            else if ([key isEqualToString:@"thumbnail_url"]) {
                _thumbnailUrl = value;
            }
            else if ([key isEqualToString:@"users"]) {
                _creators = [WMCreator creatorsWithArray:value];
            }
        }];
    }
    return self;
    
}
@end
