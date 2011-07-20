//
//  iButton.m
//  iPadFramework
//
//  Created by Nami on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iTextBox.h"
#import "NullObject.h"
#import "NSSelector.h"
#import "Constants.h"
#import "iLabel.h"
#import "Utilities.h"

@implementation iTextBox

@synthesize textBox, text, textBindableObject, placeholderBindableObject;

//Properties Wrappers
-(NSString*) text
{
	return textBox.text;
}

-(void)setText:(NSString *)aString
{
	@synchronized(self)
	{
		if (textBox.text != aString)
		{
			textBox.text = [aString retain];
			[aString release];
		}
	}
}

-(NSString*) placeholder
{
	return textBox.placeholder;
}

-(void)setPlaceholder:(NSString *)aString
{
	@synchronized(self)
	{
		if (textBox.placeholder != aString)
		{
			textBox.placeholder = [aString retain];
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
		self.textBox.borderStyle = UITextBorderStyleRoundedRect;
	else
		self.textBox.borderStyle = UITextBorderStyleNone;
}

-(void) setupLabel: (NSString*) text
{
	UILabel* label = [[UILabel alloc] init];
	label.adjustsFontSizeToFitWidth = YES;
}

-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	self.textBox = [[UITextField alloc] init];
	[super render:arguments container: parent elements: elements];
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		
		//Since by removing the control, its text will be released, do use "retain"
		[self.textBindableObject setValue:[self.textBox.text retain]];
		[self.placeholderBindableObject setValue:[self.textBox.placeholder retain]];
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
			self.textBox.text = (NSString*) bo.value;
		else
			self.textBox.placeholder = (NSString*) bo.value;
		self.locked = NO;
	}
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.textBindableObject = bo;
			self.textBox.text = (NSString*)bo.value;
			break;
		case 1:
			self.placeholderBindableObject = bo;
			self.textBox.placeholder = (NSString*)bo.value;
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
	return self.textBox.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.textBox.frame = frame;
}

-(UIView*) getView
{
	return self.textBox;
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	[self.textBox addTarget:target action:action forControlEvents:controlEvents];
}

@end
