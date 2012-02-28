//
//  WSWWWrapper.m
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WSWWWrapper.h"
#import "Film.h"

@implementation WSWWWrapper

+ (NSArray *) searchForFilmWithTitle:(NSString *)filmName
{
    Film* foundFilm = [[Film alloc] init];
    foundFilm.filmName = @"The Artist";
    return [NSArray arrayWithObject:foundFilm];
}

@end
