//
//  Tuple5.m
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tuple5.h"
#import "Utilities.h"
#import "TypedValue.h"


@implementation Tuple5
@synthesize _5;

-(Tuple1*) initialize:(NSArray*)values
{
	[super initialize:values];
	self._5 = [Utilities InitWithType:(TypedValue*)[values objectAtIndex:4]];
	return self;
}

@end
