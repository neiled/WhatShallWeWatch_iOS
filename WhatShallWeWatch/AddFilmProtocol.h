//
//  AddFilmProtocol.h
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Film.h"

@protocol AddFilm <NSObject>

- (void) AddFilm:(Film*) film;

@end
