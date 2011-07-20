//
//  Tuple3.m
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tuple3.h"
#import "Utilities.h"



@implementation Tuple3
@synthesize _3;

-(Tuple1*) initialize:(NSArray*)values
{
	[super initialize:values];
	//self._3 = [Utilities InitWithType:(TypedValue*)[values objectAtIndex:2]];
	
	id v = [values objectAtIndex:2];
	
	if (![v isKindOfClass:[BindableObject class]])
	{
		BindableObject* bo = [[BindableObject alloc] initializeWithValue:v];
		self._3 = bo;
	}
	else
	{
		if ([[v value] isKindOfClass:[BindableObject class]])
			self._3 = [v value];
		else
			self._3 = v;
	}	
	return self;
}

@end
