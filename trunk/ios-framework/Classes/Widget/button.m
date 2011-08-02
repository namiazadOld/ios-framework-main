//
//  iButton.m
//  iPadFramework
//
//  Created by Nami on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "button.h"
#import "NullObject.h"
#import "NSSelector.h"
#import "Constants.h"


@implementation button

@synthesize btn, titleBindableObject;

//Properties Wrappers
-(NSString*) title
{
	return btn.currentTitle;
}

-(void)setTitle:(NSString *)aString
{
	@synchronized(self)
	{
		if (btn.currentTitle != aString)
		{
			[btn setTitle:[aString retain] forState:btn.state];
			[aString release];
		}
	}
}


-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[super render:arguments container: parent elements: elements];
		
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.titleBindableObject setValue:[self.btn.currentTitle retain]];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.btn setTitle:(NSString*)bo.value forState:UIControlStateNormal];
		self.locked = NO;
	}
}


-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.titleBindableObject = bo;
			[self.btn setTitle:(NSString*)bo.value forState:UIControlStateNormal];
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
	return self.btn.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.btn.frame = frame;
}

-(UIView*) getView
{
	return self.btn;
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	[self.btn addTarget:target action:action forControlEvents:controlEvents];
}

@end
