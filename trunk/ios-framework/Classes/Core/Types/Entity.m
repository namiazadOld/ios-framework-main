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

+(void) all
{
	
}

@end
