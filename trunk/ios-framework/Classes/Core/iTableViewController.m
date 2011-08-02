//
//  iTableViewController.m
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iTableViewController.h"
#import "section.h"
#import "item.h"
#import "NullObject.h"


@implementation iTableViewController

@synthesize sectionList;

#pragma mark -
#pragma mark Initialization

#pragma mark -
#pragma mark View lifecycle


-(section*) getSection: (int) index
{
	int actualIndex = -1;
	
	for (section* section in self.sectionList)
	{
		if (section.visible)
			actualIndex++;
		
		if (actualIndex == index)
			return section;
	}
	
	return nil;
}

-(int) sectionCount
{
	int count = 0;
	for (section* section in self.sectionList)
		if (section.visible)
			count++;
 	return count;
}

-(item*) getItem:(section*) section at: (int) index
{
	int actualIndex = -1;
	
	for (item* item in [section itemList])
	{
		if (item.visible)
			actualIndex++;
		
		if (actualIndex == index)
			return item;
	}
	
	return nil;
}

-(int) itemCount: (section*) section
{
	int count = 0;
	for (item* item in [section itemList])
		if (item.visible)
			count++;
 	return count;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self sectionCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [[[self.sectionList objectAtIndex:section] itemList] count];
	return [self itemCount:[self getSection:section]];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
	
	item* item = [self getItem:[self getSection:indexPath.section] at:indexPath.row];
	//iItem* item = [[[self.sectionList objectAtIndex:indexPath.section] itemList] objectAtIndex:indexPath.row];
	
	// Configure the cell...
	if (cell == nil)
		cell = item.cell;
	
	cell.textLabel.text = item.title;
	
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    item* item = [self getItem:[self getSection:indexPath.section] at:indexPath.row];
	
	if (item.onClick != NULL && ![item.onClick isKindOfClass:[NullObject class]])
		[item.onClick.target performSelector:item.onClick.method];

}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	//return [[self.sectionList objectAtIndex:section] title];
	return [[self getSection:section] title];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}

@end

