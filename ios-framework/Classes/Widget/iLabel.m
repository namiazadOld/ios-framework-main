//
//  iLabel.m
//  iPadFramework
//
//  Created by Nami on 3/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iLabel.h"
#import "Constants.h"


@implementation iLabel
@synthesize label, text, textBindableObject;

//Properties Wrappers
-(NSString*) text
{
	return label.text;
}

-(void)setText:(NSString *)aString
{
	@synchronized(self)
	{
		if (label.text != aString)
		{
			label.text = [aString retain];
			[aString release];
		}
	}
}

-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	self.label = [[UILabel alloc] init];
	self.label.adjustsFontSizeToFitWidth = YES;
	[self.label setBackgroundColor:[UIColor clearColor]];
	[super render:arguments container: parent elements: elements];
	
	self.label.font = [UIFont fontWithName:@"Helvetica-Bold" size:[UIFont labelFontSize]];
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.textBindableObject setValue:[self.label.text retain]];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		self.label.text = (NSString*) bo.value;
		self.locked = NO;
	}
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.textBindableObject = bo;
			self.label.text = (NSString*)bo.value;
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
	return self.label.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.label.frame = frame;
}

-(UIView*) getView
{
	return self.label;
}

@end
