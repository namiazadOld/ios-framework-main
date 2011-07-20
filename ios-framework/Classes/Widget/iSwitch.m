//
//  iSwitch.m
//  iPadFramework
//
//  Created by Nami on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iSwitch.h"


@implementation iSwitch
@synthesize switchable, status, statusBindableObject;

-(BOOL) status
{
	return self.switchable.on;
}

-(void)setStatus: (BOOL) aBool
{
	@synchronized(self)
	{
		[self.switchable setOn:aBool animated:YES];
	}
}

-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
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
		[self.statusBindableObject setBoolValue:self.switchable.on];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.switchable setOn:bo.boolValue animated:YES];
		self.locked = NO;
	}
}


-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0: 
			statusBindableObject = bo;
			[self.switchable setOn:bo.boolValue animated:YES];
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
