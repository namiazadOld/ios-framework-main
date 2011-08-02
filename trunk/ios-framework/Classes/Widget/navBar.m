//
//  iHeader.m
//  iPadFramework
//
//  Created by Nami on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "navBar.h"
#import "NullObject.h"
#import "widgetHolder.h"


@implementation navBar

@synthesize title, rightButton, leftButton, titleBindableObject, container;

-(baseControl*) render: (NSMutableArray*)arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	[super render:arguments container: parent elements: elements];
	[self renderElements:self];
	return self;
}

-(baseControl*) getHolder
{
	baseControl* parent = self.parentWidget;
	
	while (!([parent getController] != nil && [[parent getController] navigationItem] != nil))
		parent = parent.parentWidget;
	
	return parent;
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		self.title = (NSString*)bo.value;
		
		baseControl* holder = [self getHolder];
		UIViewController* controller = [holder getController];
		
		[controller.navigationItem setTitle: self.title];
		self.locked = NO;
	}
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.titleBindableObject = bo;
			self.title = (NSString*)bo.value;
			break;
		case 1:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		default:
			break;
	}
}

//-(CGRect) getFrame
//{
//	return CGRectMake(0, 0, 0, 20);
//}

-(void) parentChanged: (baseControl*)parent
{
	[parent setHeader:self];		
}


@end
