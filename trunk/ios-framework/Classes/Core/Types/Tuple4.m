//
//  Tuple4.m
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tuple4.h"
#import "Utilities.h"



@implementation Tuple4
@synthesize _4;

-(Tuple1*) initialize:(NSArray*)values
{
	[super initialize:values];
	//self._4 = [Utilities InitWithType:(TypedValue*)[values objectAtIndex:3]];
	
	id v = [values objectAtIndex:3];
	
	if (![v isKindOfClass:[BindableObject class]])
	{
		BindableObject* bo = [[BindableObject alloc] initializeWithValue:v];
		self._4 = bo;
	}
	else
	{
		if ([[v value] isKindOfClass:[BindableObject class]])
			self._4 = [v value];
		else
			self._4 = v;
	}
	
	return self;
}

@end
