//
//  iView.m
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "widgetHolder.h"
#import "Constants.h"
#import "Utilities.h"
#import "navBar.h"


@implementation widgetHolder
@synthesize navController;



-(baseControl*) render: (NSMutableArray*)arguments container: (baseControl*)parent elements: (baseControl*) _elements
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

-(void) addBodyControl:(baseControl*) widget
{
	[Utilities AddControl:widget ToContainer:self];
}

-(void) setHeader: (navBar*) hdr
{
	hdr.container = self;
	[self.viewController.navigationController setNavigationBarHidden:NO];
	[self.viewController.navigationItem setTitle: hdr.title];	
	self.viewController.navigationItem.rightBarButtonItem = hdr.rightButton;
	self.viewController.navigationItem.leftBarButtonItem = hdr.leftButton;
}

-(void) manageArgument:(BindableObject *)bo at:(int)index
{
	//hide super method
}

-(id) getController
{
	return self.viewController;
}

@end
