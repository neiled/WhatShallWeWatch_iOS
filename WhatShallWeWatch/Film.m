//
//  Film.m
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Film.h"


@implementation Film

@synthesize filmName = _filmName;
@synthesize filmYear = _filmYear;
@synthesize rating = _rating;

- (NSComparisonResult)compareFilm:(Film *)f
{
    return [[NSNumber numberWithInt:f.rating] compare:[NSNumber numberWithInt:self.rating]];
}
@end
