//
//  iDetail.m
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "detail.h"
#import "Utilities.h"
#import "navBar.h"


@implementation detail
@synthesize detailView;

-(detail*) init
{
	self.detailView = [[UIViewController alloc] init];
	//Setting for portrait mode:
	self.detailView.view.frame = CGRectMake(269, 0, 499, 1004);
	self.detailView.view.backgroundColor = [UIColor whiteColor];
	return self;
}

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
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

-(void) setHeader:(navBar *)hdr
{
	if (detailView.navigationController == NULL)
	{
		hdr.container = self;
	}
	hdr.container = self;
	[self.detailView.navigationController setNavigationBarHidden:NO];
	[self.detailView.navigationItem setTitle: hdr.title];	
	self.detailView.navigationItem.rightBarButtonItem = hdr.rightButton;
	self.detailView.navigationItem.leftBarButtonItem = hdr.leftButton;
}

-(void) addBodyControl:(baseControl*) widget
{
	[Utilities AddControl:widget ToContainer:self];
}

-(id) getController
{
	return self.detailView;
}


@end
