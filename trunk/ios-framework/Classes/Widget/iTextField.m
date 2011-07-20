//
//  iTextField.m
//  iPadFramework
//
//  Created by Nami on 3/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iTextField.h"
#import "BindableObject.h"


@implementation iTextField
@synthesize label, textBox;

-(iBaseControl*) initialize: (NSMutableArray*) arguments container: (iBaseControl*)parent
{
	[super initialize:arguments container: parent];
	
	BindableObject* textBO = [arguments objectAtIndex:0];
	BindableObject* placeholderBO = [arguments objectAtIndex:1];
	BindableObject* labelBO = [arguments objectAtIndex:2];
	BindableObject* seperateLabelBO = [arguments objectAtIndex:3];
	BindableObject* withBorderBO = [arguments objectAtIndex:4];
	

	NSMutableArray* labelArgs = [[NSMutableArray alloc]init];	
	[labelArgs addObject:labelBO];
	self.label = [[iLabel alloc]initialize:labelArgs container: self];
	[self.label finilize];
	[labelArgs release];
		
	NSMutableArray* textBoxArgs = [[NSMutableArray alloc]init];
	[textBoxArgs addObject:textBO];
	[textBoxArgs addObject:placeholderBO];
	[textBoxArgs addObject:withBorderBO];
	
	self.textBox = [[iTextBox alloc]initialize:textBoxArgs container: self];
	[self.textBox finilize];
	[textBoxArgs release];
	
	if ([seperateLabelBO.value compare:[NSNumber numberWithBool:YES]] == NSOrderedSame)
		[self addBodyControl:self.label];	
	else {
		UILabel* actualLabel = [self.label getView];
		actualLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:[UIFont labelFontSize]];
		UITextField* actualTextBox = [self.textBox getView];
		actualTextBox.leftViewMode = UITextFieldViewModeAlways;
		actualTextBox.leftView = actualLabel;
		actualTextBox.leftView.frame = CGRectMake(0, 0, 90, 21);
		[actualTextBox.leftView layoutSubviews];
	}

	[self addBodyControl:self.textBox];
	
	return self;
}

-(void) manageArgument:(BindableObject *)bo at:(int)index
{
	//hide super method
}


@end
