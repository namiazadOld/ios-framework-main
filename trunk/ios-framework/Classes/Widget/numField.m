//
//  iNumField.m
//  iPadFramework
//
//  Created by Nami on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "numField.h"


@implementation numField
@synthesize number, numberBindableObject;

//Properties Wrappers 
-(Num*) number
{
	Num* n = [self getNumberFromText];
	if (n == nil)
		return [[Num alloc] initWithNumber:0.0];
	return n;
}

-(void)setNumber:(Num*)aNumber
{
	@synchronized(self)
	{
		self.txt.text = [aNumber toString];
	}
}

-(Num*) getNumberFromText  
{
	NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
	[f setNumberStyle:NSNumberFormatterDecimalStyle];
	NSNumber *n = [f numberFromString:self.txt.text];
	[f release];
	if (n == nil)
		return nil;
	Num* num = [[Num alloc] initWithNumber:[n floatValue]];
	return num;
}

-(void) textChangedHandler: (id)sender
{
	Num* n = [self getNumberFromText];
	if (n == nil)
		self.txt.textColor = [UIColor redColor];
	else
		self.txt.textColor = [UIColor blackColor];
}

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	[self.txt addTarget:self action:@selector(textChangedHandler:) forControlEvents:UIControlEventAllEditingEvents];
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		Num* currentValue = [self getNumberFromText];
		if (currentValue == nil)
			[self.numberBindableObject setValue:[[Num alloc] initWithNumber:0.0]];
		else
			[self.numberBindableObject setValue:currentValue];
		
		[self.placeholderBindableObject setValue:[self.txt.placeholder retain]];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		if ([bo isEqual:self.numberBindableObject])
			[self setNumber:(Num*)bo.value];
		else
			self.txt.placeholder = (NSString*) bo.value;
		self.locked = NO;
	}
}


-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[bo addListener:self];
	switch (index) {
		case 0:
			self.numberBindableObject = bo;
			[self setNumber: (Num*)bo.value];
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

@end
