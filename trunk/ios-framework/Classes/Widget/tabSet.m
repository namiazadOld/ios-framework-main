//
//  iTabSet.m
//  iPadFramework
//
//  Created by Nami on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "tabSet.h"
#import "Tuple3.h"
#import "tabpage.h"
#import "customControl.h"
#import "Utilities.h"
#import "StylingManager.h"
#import "Array.h"


@implementation tabSet
@synthesize tabController;

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.tabController = [[UITabBarController alloc] init];
	[super render:arguments container: parent elements: elements];
	return self;
}

-(void) initializeTabPages: (Array*) tabPages
{
	NSMutableArray* actualPages = [[NSMutableArray alloc] init];
	for (Tuple3* tuple in tabPages.data)
	{

		tabpage* tabPage = [[tabpage alloc] render:[[NSMutableArray alloc] initWithObjects:tuple._1, tuple._2, nil] container:self elements:NULL];
		
		customControl* content = [(customControl*)tuple._3.value render:[[NSMutableArray alloc] init] container:tabPage elements:NULL];
		[content finilize];
				
		[tabPage addBodyControl:content];
		[self addBodyControl:tabPage];
		[actualPages addObject:tabPage.tabPage];
	}

	[self.tabController setViewControllers:actualPages];
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
		{
			[self initializeTabPages:(Array*)bo.value];
			break;
		}
		case 1:
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
	return self.tabController.view.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.tabController.view.frame = frame;
	
	for (UIViewController* tabPage in self.tabController.viewControllers)
		tabPage.view.frame = frame;
	
}

-(UIView*) getView
{
	return self.tabController.view;
}

-(id) getController
{
	return self.tabController;
}

@end
