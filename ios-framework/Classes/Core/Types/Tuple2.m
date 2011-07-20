//
//  Tuple2.m
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tuple2.h"
#import "Utilities.h"
#import "TypedValue.h"


@implementation Tuple2
@synthesize _2;

-(Tuple1*) initialize:(NSArray*)values
{
	[super initialize:values];
	self._2 = [Utilities InitWithType:(TypedValue*)[values objectAtIndex:1]];
	return self;
}

@end
