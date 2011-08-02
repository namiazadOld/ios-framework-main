//
//  iButton.m
//  iPadFramework
//
//  Created by Nami on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "textBox.h"
#import "NullObject.h"
#import "NSSelector.h"
#import "Constants.h"
#import "label.h"
#import "Utilities.h"

@implementation textBox

@synthesize txt, text, textBindableObject, placeholderBindableObject;

//Properties Wrappers
-(NSString*) text
{
	return txt.text;
}

-(void)setText:(NSString *)aString
{
	@synchronized(self)
	{
		if (txt.text != aString)
		{
			txt.text = [aString retain];
			[aString release];
		}
	}
}

-(NSString*) placeholder
{
	return txt.placeholder;
}

-(void)setPlaceholder:(NSString *)aString
{
	@synchronized(self)
	{
		if (txt.placeholder != aString)
		{
			txt.placeholder = [aString retain];
			[aString release];
		}
	}
}

-(void) setControlStyle:(UIStyle *)style
{
	[super setControlStyle:style];
	
	if ([style valueForKey:@"border_style"] == nil)
		return;
	
	NSString* borderString = [[style valueForKey:@"border_style"] lowercaseString];
	if ([borderString isEqualToString:@"bordered"])
		self.txt.borderStyle = UITextBorderStyleRoundedRect;
	else
		self.txt.borderStyle = UITextBorderStyleNone;
}

-(void) setupLabel: (NSString*) text
{
	UILabel* label = [[UILabel alloc] init];
	label.adjustsFontSizeToFitWidth = YES;
}

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.txt = [[UITextField alloc] init];
	[super render:arguments container: parent elements: elements];
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		
		//Since by removing the control, its text will be released, do use "retain"
		[self.textBindableObject setValue:[self.txt.text retain]];
		[self.placeholderBindableObject setValue:[self.txt.placeholder retain]];
		self.locked = NO;
		
		NSLog((NSString*)[[self.args objectAtIndex:0] value]);
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		if ([bo isEqual:self.textBindableObject])
			self.txt.text = (NSString*) bo.value;
		else
			self.txt.placeholder = (NSString*) bo.value;
		self.locked = NO;
	}
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.textBindableObject = bo;
			self.txt.text = (NSString*)bo.value;
			break;
		case 1:
			self.placeholderBindableObject = bo;
			self.txt.placeholder = (NSString*)bo.value;
			break;
		case 2:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		default:
			break;
	}
}

-(CGRect) getFrame
{
	return self.txt.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.txt.frame = frame;
}

-(UIView*) getView
{
	return self.txt;
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	[self.txt addTarget:target action:action forControlEvents:controlEvents];
}

@end
