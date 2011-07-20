//
//  Tuple1.m
//  ipad-framework-main
//
//  Created by Nami on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tuple1.h"
#import "TypedValue.h"
#import "Utilities.h"


@implementation Tuple1
@synthesize _1;

-(Tuple1*) initialize:(NSArray*)values
{
	self._1 = [Utilities InitWithType:(TypedValue*)[values objectAtIndex:0]];
	return self;
}

@end
