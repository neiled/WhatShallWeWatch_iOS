//
//  AddFilmViewController.m
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 13/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddFilmViewController.h"
#import "WSWWWrapper.h"
#import "Film.h"
#import "AddFilmProtocol.h"
#import "AddFilmTableViewCell.h"

@implementation AddFilmViewController
@synthesize searchDisplayController;
@synthesize searchBar;
@synthesize allItems = _allItems;
@synthesize searchResults = _searchResults;
@synthesize foundFilmTableView = _foundFilmTableView;
@synthesize addFilmDelegate = _addFilmDelegate;


-(void)searchBarSearchButtonClicked:(UISearchBar *)sender
{
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];

    [HUD show:YES];

    [WSWWWrapper searchForFilmWithTitle:[sender text] success:^(NSArray* films){
        [HUD hide:YES];
        self.searchResults = [NSArray arrayWithArray:films];
        [self.searchDisplayController.searchResultsTableView reloadData];
    }
                                failure:^(NSError* error){
                                    [HUD hide:YES];
                                    [self showAlertWithMessage: @"Unable to connect the internet."];
                                }];
}

-(void)showAlertWithMessage:(NSString * )message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Issue" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.searchResults count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Found Film";
	
	AddFilmTableViewCell *cell = [[self foundFilmTableView] dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
		cell = [[AddFilmTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
	if ([self.searchResults count] == 0)
		cell.textLabel.text = @"(Nothing found)";
	else
    {
        Film* foundFilm = [self.searchResults objectAtIndex:indexPath.row];
		cell.filmTitleLabel.text = foundFilm.filmName;
        cell.yearLabel.text = foundFilm.filmYear;
        cell.ratingLabel.text = [NSString stringWithFormat:@"%d",foundFilm.rating];
    }
    
	return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Film* foundFilm = [self.searchResults objectAtIndex:indexPath.row];
    self.allItems = [self.allItems arrayByAddingObject:[self.searchResults objectAtIndex:indexPath.row]];
    NSLog(@"filteredListContent: %@", foundFilm );
    
    [self.addFilmDelegate AddFilm:foundFilm];
    
    [[self navigationController] popViewControllerAnimated:YES];

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


//- (void)loadView
//{
//    [super loadView];
//    [self.searchDisplayController setActive:YES];
//
//}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
// 
//}


- (void)viewDidUnload
{
    [self setSearchDisplayController:nil];
    [self setSearchBar:nil];
    [self setFoundFilmTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
