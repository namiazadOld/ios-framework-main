//
//  iSwitch.m
//  iPadFramework
//
//  Created by Nami on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "check.h"


@implementation check
@synthesize switchable, status, statusBindableObject;

Bool* statusCache;

-(Bool*) status
{
	if (statusCache == NULL)
		statusCache = [[Bool alloc] initWithBool:switchable.on];
	statusCache.value = switchable.on;
	return statusCache;
}

-(void)setStatus: (Bool*) aBool
{
	@synchronized(self)
	{
		[self.switchable setOn:aBool.value animated:YES];
	}
}

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.switchable = [[UISwitch alloc] init];
	[super render:arguments container: parent elements: elements];
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.statusBindableObject setValue:self.status];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.switchable setOn:[bo.value value] animated:YES];
		self.locked = NO;
	}
}


-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0: 
			statusBindableObject = bo;
			[self setStatus:bo.value];
			break;
		case 1:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		default:
			break;
	}
}

-(CGRect) getFrame
{
	return self.switchable.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.switchable.frame = frame;
}

-(UIView*) getView
{
	return self.switchable;
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	[self.switchable addTarget:target action:action forControlEvents:controlEvents];
}


@end
