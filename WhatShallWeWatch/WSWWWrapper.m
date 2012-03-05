//
//  WSWWWrapper.m
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WSWWWrapper.h"
#import "Film.h"
#import "AFNetworking.h"
#import <stdlib.h>

@implementation WSWWWrapper

+ (NSArray *) searchForFilmWithTitle:(NSString *)filmName
{
    Film* foundFilm = [[Film alloc] init];
//    foundFilm.filmName = @"The Artist";
//    foundFilm.filmYear = @"2011";
//    foundFilm.rating = arc4random() % 100;
//    return [NSArray arrayWithObject:foundFilm];

    NSURL *url = [NSURL URLWithString:@"http://localhost.com:4567/api/v1/film_search/artist"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Results:%@", JSON);
        //NSLog(@"Name: %@ %@", [JSON valueForKeyPath:@"first_name"], [JSON valueForKeyPath:@"last_name"]);
    } failure:nil];

    [operation start];
}

@end
