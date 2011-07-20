//
//  mobl.m
//  ipad-framework-main
//
//  Created by Nami on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "mobl.h"
#import "Utilities.h"


@implementation mobl

+(void) add: (Entity*) newItem
{

	NSManagedObject* entity = (NSManagedObject*)[NSEntityDescription 
												insertNewObjectForEntityForName:[NSStringFromClass([newItem class]) stringByAppendingString:@"__Description"]
												inManagedObjectContext:[Utilities ManagedObjectContext]];
	
	[newItem sync:entity];
	
	NSError *error = nil;
	if (![[Utilities ManagedObjectContext] save:&error]) {
		// Handle the error.
	}
}

@end
