//
//  iView.m
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iView.h"
#import "Constants.h"
#import "Utilities.h"
#import "iHeader.h"


@implementation iView
@synthesize navController;



-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) _elements
{
	viewController = [[UIViewController alloc]init];
	[super render:arguments container: parent elements: _elements];
	
	self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
	[self.navController setNavigationBarHidden:YES];
	
	return self;
}

-(CGRect) getFrame
{
	return self.viewController.view.frame;
}

-(UIView*) getView
{
	return self.viewController.view;
}

-(UIView*) getChildrenHolder
{
	return self.viewController.view;
}

-(void) addBodyControl:(iBaseControl*) widget
{
	[Utilities AddControl:widget ToContainer:self];
}

-(void) setHeader: (iHeader*) header
{
	header.container = self;
	[self.viewController.navigationController setNavigationBarHidden:NO];
	[self.viewController.navigationItem setTitle: header.title];	
	self.viewController.navigationItem.rightBarButtonItem = header.rightButton;
	self.viewController.navigationItem.leftBarButtonItem = header.leftButton;
}

-(void) manageArgument:(BindableObject *)bo at:(int)index
{
	//hide super method
}

@end
