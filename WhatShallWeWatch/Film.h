//
//  Film.h
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Film : NSObject

@property (nonatomic, strong) NSString *filmName;
@property (nonatomic, strong) NSString *filmYear;
@property int rating;

@end
