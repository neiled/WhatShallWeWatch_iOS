//
//  WSWWWrapper.m
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WSWWWrapper.h"
#import "Film.h"
#import "AFJSONRequestOperation.h"
#import <stdlib.h>

@implementation WSWWWrapper

+ (void) searchForFilmWithTitle:(NSString *)filmName success:(void (^)(id JSON))success
{
    NSMutableString *baseURL = [NSMutableString stringWithString:@"http://whatshallwewatch.com/api/v1/film_search/"];
    [baseURL appendString:filmName];
    
    NSString *finalURL = [baseURL stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];

    NSURL *url = [NSURL URLWithString:finalURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                              success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                                                                      success([WSWWWrapper parseFilms:JSON]);
                                                                                                  });
                                                                                              } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                                                                                                        {
                                                                                                            NSLog(@"%@", error);
                                                                                                        }
        ];

        [operation start];
    });
}

+(NSMutableArray *) parseFilms:(NSArray *) JSON
{
    NSMutableArray *filmResults = [[NSMutableArray alloc]init];

    for (NSDictionary *currentFilm in JSON)
    {
        Film *newFilm = [[Film alloc] init];
        newFilm.filmName = [currentFilm valueForKey:@"title"];
        newFilm.filmYear = [NSString stringWithFormat:@"%@", [currentFilm valueForKey:@"year"]];
        newFilm.rating = [[currentFilm valueForKey:@"rating"] intValue];
        [filmResults addObject:newFilm];
    }

    return filmResults;
}

@end
