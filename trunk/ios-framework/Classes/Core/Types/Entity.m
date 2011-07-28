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


@implementation Entity
@synthesize id;

+(NSEntityDescription*) createDescription: (NSString*)name
{
	NSEntityDescription *nsed = [[NSEntityDescription alloc] init];
	[nsed setName:name];
	[nsed setManagedObjectClassName:name];
	return nsed;
}

-(void) sync: (NSManagedObject*)entity   
{
	
}

-(void) reSync: (NSManagedObject*)entity
{
	
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

-(BindableObject*) reConvert: (id) attr
{
	if ([attr isKindOfClass:[NSNumber class]])
	{
		NSNumber* ns = (NSNumber*)attr;
		if (strcmp([ns objCType], @encode(BOOL)) == 0)
			return [[BindableObject alloc] initializeWithValue:[[Bool alloc] initWithBool:[ns boolValue]]];
		else if (strcmp([ns objCType], @encode(float)) == 0)
			return [[BindableObject alloc] initializeWithValue:[[Num alloc] initWithNumber:[ns floatValue]]];
		
		return nil;
	}
	
	if ([attr isKindOfClass:[NSDate class]])
	{
		DateTime* dt = [[DateTime alloc] init];
		dt._date = attr;
		return [[BindableObject alloc] initializeWithValue:dt];
	}
	
	return [[BindableObject alloc] initializeWithValue:attr];
}

//Static Methods

+(Collection*) all
{
	return nil;
}

@end
