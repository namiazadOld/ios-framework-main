//
//  iDetail.m
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iDetail.h"
#import "Utilities.h"
#import "iHeader.h"


@implementation iDetail
@synthesize detailView;

-(iDetail*) init
{
	self.detailView = [[UIViewController alloc] init];
	//Setting for portrait mode:
	self.detailView.view.frame = CGRectMake(269, 0, 499, 1004);
	self.detailView.view.backgroundColor = [UIColor whiteColor];
	return self;
}

-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{	
	[super render:arguments container: parent elements: elements];
	return self;
}

-(CGRect) getFrame
{
	return self.detailView.view.frame;
}

-(void)setFrame:(CGRect)frame
{
	//since this control is completely internal, style management should not be applied on that.
}

-(UIView*) getView
{
	return self.detailView.view;
}

-(void) setHeader:(iHeader *)header
{
	if (detailView.navigationController == NULL)
	{
		header.container = self;
	}
	header.container = self;
	[self.detailView.navigationController setNavigationBarHidden:NO];
	[self.detailView.navigationItem setTitle: header.title];	
	self.detailView.navigationItem.rightBarButtonItem = header.rightButton;
	self.detailView.navigationItem.leftBarButtonItem = header.leftButton;
}

-(void) addBodyControl:(iBaseControl*) widget
{
	[Utilities AddControl:widget ToContainer:self];
}

@end
