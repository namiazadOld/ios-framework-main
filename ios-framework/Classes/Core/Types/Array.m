//
//  Array.m
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Array.h"


@implementation Array
@synthesize length = _length, data;

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

-(NSObject*) get: (Num*) n
{
	return [data objectAtIndex:n.value];
}

-(void) push: (NSObject*) item
{
	[data addObject:item];
}

-(NSString*) join: (NSString*) sep
{
	NSMutableString* result = [[NSMutableString alloc] initWithString:@""];
	
	int index = 0;
	for (NSObject* item in data)
	{
		if (index == 0)
			[result appendString:[item toString]];
		else
			[result appendFormat:@"%@%@", sep, [item toString]];
		index++;
	}
	
	return result;
}

-(NSObject*) one
{
	if ([data count] == 0)
		return nil;
	return [data objectAtIndex:0];
}

-(Bool*) contains: (NSObject*) item
{
	return [[Bool alloc] initWithBool:[data containsObject:item]];
}

-(Array*) splice: (Num*)idx arg:(Num*)numToDelete
{
	int startIndex = idx.value;
	int count = numToDelete.value;
	
	while (count > 0)
	{
		[data removeObjectAtIndex:startIndex];
		count--;
	}
		
	return self;
}

-(void) insert: (Num*) idx arg:(NSObject*)item
{
	[data insertObject:item atIndex:idx.value];
}

-(void) remove: (NSObject*) item
{
	[data removeObject:item];
}

-(Array*) initWithObjects:(NSObject*)firstObj, ...
{
	[self init];
	
	va_list args;
    va_start(args, firstObj);
	for (NSObject* arg = firstObj; arg != nil; arg = va_arg(args, NSObject*))
        [data addObject:arg];
    va_end(args);
	return self;
}

@end
