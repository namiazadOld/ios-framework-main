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
	if (prop.type == Num)
		return [NSNumber numberWithFloat:prop.numValue];
	
	if (prop.type == Bool)
		return [NSNumber numberWithBool:prop.boolValue];
	
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
