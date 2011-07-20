//
//  iNavigationButton.m
//  iPadFramework
//
//  Created by Nami on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iNavigationButton.h"
#import "NullObject.h"
#import "NSSelector.h"


@implementation iNavigationButton

@synthesize button, titleBindableObject, header;

//Properties Wrappers
-(NSString*) title
{
	return button.title;
}

-(void)setTitle:(NSString *)aString
{
	@synchronized(self)
	{
		if (button.title != aString)
		{
			[button setTitle:[aString retain]];
			[aString release];
		}
	}
}


-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	self.button = [[UIBarButtonItem alloc] init];
	[self.button setStyle:UIBarButtonSystemItemFastForward];
	[super render:arguments container: parent elements: elements];
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.titleBindableObject setValue:[self.button.title retain]];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.button setTitle:(NSString*)bo.value];
		self.locked = NO;
	}
}


-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			titleBindableObject = bo.value;
			[self.button setTitle:(NSString*)bo.value];
			break;
		case 1:
		{
			NSSelector* methodSelector = (NSSelector*)bo.value;
			[self addTarget: methodSelector.target action: methodSelector.method forControlEvents:UIControlEventTouchUpInside];
			break;
		}
		case 2:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		default:
			break;
	}
}


-(CGRect) getFrame
{
	return CGRectMake(0.0, 0.0, self.button.width, 0.0);
}

-(void)setFrame:(CGRect)frame
{
	[self.button setWidth:frame.size.width];
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	[self.button setAction:action];
	[self.button setTarget:target];
}

@end
