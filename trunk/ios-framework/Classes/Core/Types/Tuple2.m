//
//  Tuple2.m
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tuple2.h"
#import "Utilities.h"



@implementation Tuple2
@synthesize _2;

-(Tuple1*) initialize:(NSArray*)values
{
	[super initialize:values];
	//self._2 = [Utilities InitWithType:(TypedValue*)[values objectAtIndex:1]];
	
	id v = [values objectAtIndex:1];
	
	if (![v isKindOfClass:[BindableObject class]])
	{
		BindableObject* bo = [[BindableObject alloc] initializeWithValue:v];
		self._2 = bo;
	}
	else
	{
		if ([[v value] isKindOfClass:[BindableObject class]])
			self._2 = [v value];
		else
			self._2 = v;
	}			
	
	
	return self;
}

@end
