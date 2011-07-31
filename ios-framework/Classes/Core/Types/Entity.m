//
//  Entity.m
//  ipad-framework-main
//
//  Created by Nami on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Entity.h"
#import "Utilities.h"
#import "DateTime.h"
#import "Num.h"
#import "Bool.h"
#import "Collection.h"
#import "NullObject.h"


@implementation Entity
@synthesize id, eId;

+(NSEntityDescription*) createDescription: (NSString*)name
{
	NSEntityDescription *nsed = [[NSEntityDescription alloc] init];
	[nsed setName:name];
	[nsed setManagedObjectClassName:name];
	return nsed;
}

-(id) convert: (BindableObject*) prop
{
	if ([prop.value isKindOfClass:[Num class]])
	{
		Num* v = (Num*)prop.value;
		return [NSNumber numberWithFloat:v.value];
	}
	
	if ([prop.value isKindOfClass:[Bool class]])
	{
		Bool* v = (Bool*)prop.value;
		return [NSNumber numberWithBool:v.value];
	}

	if (prop.value == nil)
		return nil;
	
	if ([prop.value isKindOfClass:[DateTime class]])
		return [prop.value date];
	
	return prop.value;
}

-(NSObject*) reConvert: (id) attr
{
	if ([attr isKindOfClass:[NSNumber class]])
	{
		NSNumber* ns = (NSNumber*)attr;
	
		if (strcmp([ns objCType], "d") == 0)
			return [[Num alloc] initWithNumber:[ns floatValue]];
		else
			return [[Bool alloc] initWithBool:[ns boolValue]];
		
		return [[NullObject alloc] init];
	}
	
	if ([attr isKindOfClass:[NSDate class]])
	{
		DateTime* dt = [[DateTime alloc] init];
		dt._date = attr;
		return dt;
	}
	
	return attr;
}

-(void) sync: (NSManagedObject*)entity
{
	
}


-(void) reSync: (NSManagedObject*)entity
{
	self.eId = [entity objectID];
}

-(Bool*) e: (NSObject*) n
{
	if (![n isKindOfClass:[Entity class]])
		return [[Bool alloc] initWithBool:NO];
	Entity* input = (Entity*)n;
	return [[Bool alloc] initWithBool:[self.eId isEqual:input.eId]];
}

-(Bool*) ne: (NSObject*) n
{
	if (![n isKindOfClass:[Entity class]])
		return [[Bool alloc] initWithBool:YES];
	Entity* input = (Entity*)n;
	return [[Bool alloc] initWithBool:![self.eId isEqual:input.eId]];
}

-(BOOL) isEqual:(id)object
{
	return [[self e:object] value];
}


//Static Methods

+(Collection*) all
{
	return nil;
}



@end
