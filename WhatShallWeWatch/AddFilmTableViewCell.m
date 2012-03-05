//
//  AddFilmTableViewCellCell.m
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 29/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddFilmTableViewCell.h"

@implementation AddFilmTableViewCell

@synthesize filmTitleLabel = _filmTitleLabel;
@synthesize yearLabel = _yearLabel;
@synthesize genreLabel = _genreLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
