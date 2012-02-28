//
//  WSWWViewController.h
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 13/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddFilmProtocol.h"

@interface WSWWViewController : UITableViewController <AddFilm>
@property (nonatomic, strong) NSArray *allItems;

@end
