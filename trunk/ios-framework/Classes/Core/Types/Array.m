//
//  Array.m
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Array.h"


@implementation Array
@synthesize length = _length;

-(Array*) init
{
	data = [[NSMutableArray alloc] init];
	_length = [[BindableObject alloc] initializeWithValue:[[Num alloc] initWithNumber:0]];
	return self;
}

-(BindableObject*) length
{
	[(Num*)[_length value] setValue:[data count]];
	return _length;
}

-(Object*) get: (Num*) n
{
	return [data objectAtIndex:n.value];
}

-(void) push: (Object*) item
{
	[data addObject:item];
}

-(String*) join: (String*) sep
{
	NSMutableString* result = [[NSMutableString alloc] initWithString:@""];
	
	int index = 0;
	for (Object* item in data)
	{
		if (index == 0)
			[result appendString:[[item toString] value]];
		else
			[result appendFormat:@"%@%@", sep.value, [[item toString] value]];
		index++;
	}
	
	return [[String alloc] initWithString:result];
}

-(Object*) one
{
	if ([data count] == 0)
		return nil;
	return [data objectAtIndex:0];
}

-(Bool*) contains: (Object*) item
{
	return [[Bool alloc] initWithBool:[data containsObject:item]];
}

-(Array*) splice: (Num*)idx arg:(Num*)numToDelete
{
	[data removeObjectsFromIndices:idx.value numIndices:numToDelete.value];
	return self;
}

-(void) insert: (Num*) idx arg:(Object*)item
{
	[data insertObject:item atIndex:idx.value];
}

@end
