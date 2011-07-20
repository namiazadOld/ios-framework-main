//
//  Bool.m
//  ipad-framework-main
//
//  Created by Nami on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Bool.h"


@implementation Bool
@synthesize value;

-(Bool*) initWithBool: (BOOL)_value
{
	value = _value;
	return self;
}
@end
