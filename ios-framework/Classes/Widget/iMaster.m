//
//  iMaster.m
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iMaster.h"
#import "Utilities.h"
#import "iHeader.h"


@implementation iMaster
@synthesize masterView;

-(iMaster*) init
{
	self.masterView = [[UIViewController alloc] init];
	//Setting for portrait mode:
	self.masterView.view.frame = CGRectMake(0, 0, 268, 1004);
	self.masterView.view.backgroundColor = [UIColor whiteColor];
	return self;
}

-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container: parent elements: elements];
	return self;
}

-(CGRect) getFrame
{
	return self.masterView.view.frame;
}

-(void)setFrame:(CGRect)frame
{
	//since this control is completely internal, style management should not be applied on that.
}

-(UIView*) getView
{
	return self.masterView.view;
}

-(void) setHeader:(iHeader *)header
{
	header.container = self;
	[self.masterView.navigationController setNavigationBarHidden:NO];
	[self.masterView.navigationItem setTitle: header.title];	
	self.masterView.navigationItem.rightBarButtonItem = header.rightButton;
	self.masterView.navigationItem.leftBarButtonItem = header.leftButton;
}

-(void) addBodyControl:(iBaseControl*) widget
{
	[Utilities AddControl:widget ToContainer:self];
}

@end
