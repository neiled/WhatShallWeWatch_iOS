//
//  AddFilmTableViewCellCell.h
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 29/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddFilmTableViewCell : UITableViewCell

@property(nonatomic,readonly,retain) IBOutlet UILabel* filmTitleLabel;
@property(nonatomic,readonly,retain) IBOutlet UILabel* yearLabel;
@property(nonatomic,readonly,retain) IBOutlet UILabel* ratingLabel;

@end
