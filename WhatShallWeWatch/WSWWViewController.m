//
//  WSWWViewController.m
//  WhatShallWeWatch
//
//  Created by Neil Edwards on 13/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WSWWViewController.h"
#import "AddFilmViewController.h"
#import "AddFilmTableViewCell.h"

@implementation WSWWViewController

@synthesize allItems = _allItems;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void)AddFilm:(Film *)film
{
    if(!self.allItems)
        self.allItems = [NSMutableArray arrayWithObject:film];
    else
        [self.allItems addObject:film];
    
    [self.allItems sortUsingSelector:@selector(compareFilm:)];
    [self.tableView reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.allItems count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Chosen Film";
	
	AddFilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
		cell = [[AddFilmTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    Film* foundFilm = [self.allItems objectAtIndex:indexPath.row];
//    cell.textLabel.text = foundFilm.filmName;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",foundFilm.rating];
    cell.filmTitleLabel.text = foundFilm.filmName;
    cell.yearLabel.text = foundFilm.filmYear;
    cell.ratingLabel.text = [NSString stringWithFormat:@"%d",foundFilm.rating];    
    
    
	return cell;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates];    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.allItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:YES];      
    }       
    [tableView endUpdates];    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SearchForFilm"])
    {
        AddFilmViewController *detailViewController = [segue destinationViewController];
        detailViewController.addFilmDelegate = self;
        
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
