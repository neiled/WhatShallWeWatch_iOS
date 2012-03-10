//
//  WSWWWrapper.h
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSWWWrapper : NSObject

+ (void) searchForFilmWithTitle:(NSString *)filmName success:(void (^)(id JSON))success failure:(void (^)(NSError *error))failure;
+ (NSArray *) parseFilms:(NSArray *)JSON;

@end
