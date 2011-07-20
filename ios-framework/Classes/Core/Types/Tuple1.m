//
//  Tuple1.m
//  ipad-framework-main
//
//  Created by Nami on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tuple1.h"
#import "Utilities.h"


@implementation Tuple1
@synthesize _1;

-(Tuple1*) initialize:(NSArray*)values
{
	//self._1 = [Utilities InitWithType:(TypedValue*)[values objectAtIndex:0]];
//	return self;
	
	id v = [values objectAtIndex:0];
	
	if (![v isKindOfClass:[BindableObject class]])
	{
		BindableObject* bo = [[BindableObject alloc] initializeWithValue:v];
		self._1 = bo;
	}
	else
	{
		if ([[v value] isKindOfClass:[BindableObject class]])
			self._1 = [v value];
		else
			self._1 = v;
	}
	return self;
}

@end
