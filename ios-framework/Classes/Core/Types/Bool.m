//
//  Bool.m
//  ipad-framework-main
//
//  Created by Nami on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Bool.h"


@implementation Bool
@synthesize value;

-(Bool*) initWithBool: (BOOL)_value
{
	value = _value;
	return self;
}

-(Bool*) Not
{
	return [[Bool alloc] initWithBool:!value];
}

-(BOOL) isTrue
{
	return value == YES;
}

-(NSString*) toString
{
	if (value)
		return @"True";
	return @"False";
}

-(Bool*) e: (NSObject*) n
{
	if (![n isKindOfClass:[Bool class]])
		return [[Bool alloc] initWithBool:NO];
	Bool* input = (Bool*)n;
	return [[Bool alloc] initWithBool:(self.value == input.value)];
}

-(Bool*) ne: (NSObject*) n
{
	if (![n isKindOfClass:[Bool class]])
		return [[Bool alloc] initWithBool:YES];
	Bool* input = (Bool*)n;
	return [[Bool alloc] initWithBool:(self.value != input.value)];
}

-(Bool*) and: (Bool*) b
{
	return [[Bool alloc] initWithBool:(self.value && b.value)];
}

-(Bool*) or: (Bool*) b
{
	return [[Bool alloc] initWithBool:(self.value || b.value)];
}


@end
