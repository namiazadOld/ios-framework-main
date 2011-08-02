//
//  iLabel.m
//  iPadFramework
//
//  Created by Nami on 3/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "label.h"
#import "Constants.h"


@implementation label
@synthesize lbl, text, textBindableObject;

//Properties Wrappers
-(NSString*) text
{
	return lbl.text;
}

-(void)setText:(NSString *)aString
{
	@synchronized(self)
	{
		if (lbl.text != aString)
		{
			lbl.text = [aString retain];
			[aString release];
		}
	}
}

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.lbl = [[UILabel alloc] init];
	self.lbl.adjustsFontSizeToFitWidth = YES;
	[self.lbl setBackgroundColor:[UIColor clearColor]];
	[super render:arguments container: parent elements: elements];
	
	self.lbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:[UIFont labelFontSize]];
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.textBindableObject setValue:[self.lbl.text retain]];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		self.lbl.text = (NSString*) bo.value;
		self.locked = NO;
	}
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.textBindableObject = bo;
			self.lbl.text = (NSString*)bo.value;
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
	return self.lbl.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.lbl.frame = frame;
}

-(UIView*) getView
{
	return self.lbl;
}

@end
