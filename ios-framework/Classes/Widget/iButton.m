//
//  iButton.m
//  iPadFramework
//
//  Created by Nami on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iButton.h"
#import "NullObject.h"
#import "NSSelector.h"
#import "Constants.h"


@implementation iButton

@synthesize button, titleBindableObject;

//Properties Wrappers
-(NSString*) title
{
	return button.currentTitle;
}

-(void)setTitle:(NSString *)aString
{
	@synchronized(self)
	{
		if (button.currentTitle != aString)
		{
			[button setTitle:[aString retain] forState:button.state];
			[aString release];
		}
	}
}


-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[super render:arguments container: parent elements: elements];
		
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.titleBindableObject setValue:[self.button.currentTitle retain]];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.button setTitle:(NSString*)bo.value forState:UIControlStateNormal];
		self.locked = NO;
	}
}


-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.titleBindableObject = bo;
			[self.button setTitle:(NSString*)bo.value forState:UIControlStateNormal];
			break;
		case 1:
		{
			NSSelector* methodSelector = (NSSelector*)bo.value;
			[self addTarget: methodSelector.target action: methodSelector.method forControlEvents:UIControlEventTouchUpInside];
			break;
		}
		case 2:
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
	return self.button.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.button.frame = frame;
}

-(UIView*) getView
{
	return self.button;
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	[self.button addTarget:target action:action forControlEvents:controlEvents];
}

@end
