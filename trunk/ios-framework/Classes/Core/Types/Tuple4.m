//
//  Tuple4.m
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tuple4.h"
#import "Utilities.h"
#import "TypedValue.h"


@implementation Tuple4
@synthesize _4;

-(Tuple1*) initialize:(NSArray*)values
{
	[super initialize:values];
	self._4 = [Utilities InitWithType:(TypedValue*)[values objectAtIndex:3]];
	return self;
}

@end
