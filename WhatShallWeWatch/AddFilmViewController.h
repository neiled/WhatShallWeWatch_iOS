//
//  AddFilmViewController.h
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 13/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddFilmViewController : UITableViewController  <UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *allItems;
@property (nonatomic, strong) NSArray *searchResults;

@end