//
//  NSStack.m
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSStack.h"


@implementation NSStack
@synthesize storage;

-(NSStack*) init
{
	storage = [[NSMutableArray alloc]init];
	return self;
}

-(void) push: (id) value
{
	[storage addObject:value];
}

-(id) pop
{
	id top = [storage objectAtIndex:[storage count] - 1];
	[storage removeLastObject];
	return top;
}

-(id)top
{
	if ([storage count] == 0)
		return NULL;
	return [storage objectAtIndex:[storage count] - 1];
}

@end
