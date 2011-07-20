//
//  iTable.m
//  iPadFramework
//
//  Created by Nami on 1/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iTable.h"
#import "iTableViewController.h"
#import "iView.h"
#import "Constants.h"
#import "iEmptyWidget.h"
#import "iHeader.h"


@implementation iTable
@synthesize tableViewController, sectionList, title;

-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container: parent elements: elements];
	sectionList = [[NSMutableArray alloc]init];
	
	[self renderElements:self];
	
	return self;
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
		{
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		}
		default:
			break;
	}
	
}


-(CGRect) getFrame
{
	return self.tableViewController.tableView.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.tableViewController.tableView.frame = frame;
}

-(UIView*) getView
{
	return self.tableViewController.tableView;
}

- (void)orientationChanged:(UIInterfaceOrientation)toInterfaceOrientation
{
	if (UIDeviceOrientationIsPortrait(toInterfaceOrientation))
		self.tableViewController.tableView.frame = CGRectMake(0.0, 0.0, 768.0, 1004.0);
	else if(UIDeviceOrientationIsLandscape(toInterfaceOrientation))
		self.tableViewController.tableView.frame = CGRectMake(0.0, 0.0, 1004.0, 768.0);
}

-(void) finilize
{
	UITableViewStyle style = [self.sectionList count] > 1 ? UITableViewStyleGrouped : UITableViewStylePlain;
	self.tableViewController = [[iTableViewController alloc] initWithStyle:style];
	self.tableViewController.sectionList = self.sectionList;
	self.tableViewController.title = self.title;
}

-(void) childUpdated: (iBaseControl*)child
{
	[self.tableViewController.tableView reloadData];
}



@end
