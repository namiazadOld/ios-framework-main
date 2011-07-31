//
//  NullObject.m
//  iPadFramework
//
//  Created by Nami on 1/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NullObject.h"
#import "Bool.h"

@implementation NullObject

-(BOOL) isEqual:(id)object
{
	return [object isKindOfClass:[NullObject class]];
}

-(Bool*) e: (NSObject*) n
{
	if (![n isKindOfClass:[NullObject class]])
		return [[Bool alloc] initWithBool:NO];
	return [[Bool alloc] initWithBool:YES];
}

-(Bool*) ne: (NSObject*) n
{
	if (![n isKindOfClass:[NullObject class]])
		return [[Bool alloc] initWithBool:YES];
	return [[Bool alloc] initWithBool:NO];
	
}


@end
