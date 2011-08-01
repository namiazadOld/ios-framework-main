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

+(void) setInstance:(Scope*)_scope
{
	instance = _scope;
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
	parent = nil;
	variables = [[NSMutableDictionary alloc] init];
	//variables = [NSMutableDictionary dictionaryWithCapacity:0];
	return self;
}

-(void) assign: (NSString*)key value: (NSObject*) _value
{
	BindableObject* b = (BindableObject*)[self get:key];
	
	if (b != nil)
		b.value = _value;
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
	[Scope setInstance:innerScope];
}

-(void) exitScope
{
	instance = self.parent;
	//[self release];
}


@end
