//
//  AddFilmViewController.h
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 13/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddFilmProtocol.h"
#import "MBProgressHUD.h"


@interface AddFilmViewController : UITableViewController  <UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>
{
	MBProgressHUD *HUD;
}
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) id<AddFilm> addFilmDelegate;
@property (nonatomic, strong) NSArray *allItems;
@property (nonatomic, strong) NSArray *searchResults;
@property (weak, nonatomic) IBOutlet UITableView *foundFilmTableView;

@end
