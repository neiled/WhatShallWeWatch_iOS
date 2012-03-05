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

+ (void) searchForFilmWithTitle:(NSString *)filmName success:(void (^)(id JSON))success
{
//    Film* foundFilm = [[Film alloc] init];
//    foundFilm.filmName = @"The Artist";
//    foundFilm.filmYear = @"2011";
//    foundFilm.rating = arc4random() % 100;
//    return [NSArray arrayWithObject:foundFilm];

    NSURL *url = [NSURL URLWithString:@"http://localhost:4567/api/v1/film_search/artist"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Results:%@", JSON);
        success(JSON);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                                                                                                                      {
                                                                                                                          NSLog(@"%@", error);
                                                                                                                      }
    ];

    [operation start];
}

@end
