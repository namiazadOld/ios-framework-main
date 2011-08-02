//
//  iMaster.m
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "master.h"
#import "Utilities.h"
#import "navBar.h"


@implementation master
@synthesize masterView;

-(master*) init
{
	self.masterView = [[UIViewController alloc] init];
	//Setting for portrait mode:
	self.masterView.view.frame = CGRectMake(0, 0, 268, 1004);
	self.masterView.view.backgroundColor = [UIColor whiteColor];
	return self;
}

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
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

-(void) setHeader:(navBar *)hdr
{
	hdr.container = self;
	[self.masterView.navigationController setNavigationBarHidden:NO];
	[self.masterView.navigationItem setTitle: hdr.title];	
	self.masterView.navigationItem.rightBarButtonItem = hdr.rightButton;
	self.masterView.navigationItem.leftBarButtonItem = hdr.leftButton;
}

-(void) addBodyControl:(baseControl*) widget
{
	[Utilities AddControl:widget ToContainer:self];
}

-(id) getController
{
	return self.masterView;
}

@end
