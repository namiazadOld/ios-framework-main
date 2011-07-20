//
//  Scope.m
//  iPadFramework
//
//  Created by Nami on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scope.h"
#import "BindableObject.h"
#import "Utilities.h"




@implementation Scope

@synthesize parent, variables;

static Scope* instance;

+(Scope*) instance
{
	return instance;
}

+(void) initialize
{
	//nice usage of static variables
	static BOOL initialized = NO;
	if (!initialized)
	{
		initialized = YES;
		instance = [[Scope alloc] init];
	}
}

-(Scope*) init
{
	self.parent = nil;
	self.variables = [[NSMutableDictionary alloc] init];
	return self;
}

-(void) assignRef: (NSString*)key value: (id) value
{
	BindableObject* b = (BindableObject*)[self get:key];
	
	if (b != nil)
	{
		if ([value isKindOfClass:[BindableObject class]])
		{
			switch (b.type) {
				case Num:
					b.numValue = [value numValue];
					break;
				case Bool:
					b.boolValue = [value boolValue];
					break;
				case Ref:
					b.value = [value value];
					break;
				default:
					break;
			}
		}
		else
			b.value = value;
	}
}

-(void) assignNum: (NSString*)key value: (float) value
{
	BindableObject* b = (BindableObject*)[self get:key];
	b.numValue = value;
}

-(void) assignBool: (NSString*)key value: (BOOL) value
{
	BindableObject* b = (BindableObject*)[self get:key];
	b.boolValue = value;
}

-(void) set: (NSString*)key variable: (NSObject*) variable
{
	[self.variables setObject:variable forKey:key];
}

-(NSObject*) get: (NSString*) key
{
	NSObject* variable = [self.variables objectForKey:key];
	
	if (variable == nil)
		return [self.parent get:key];
	
	return variable;
}


-(void) createInnerScope
{
	Scope* innerScope = [[Scope alloc] init];
	innerScope.parent = self;
	instance = innerScope;
}

-(void) exitScope
{
	instance = self.parent;
	//[self release];
}

@end
