//
//  TypedValue.m
//  ipad-framework-main
//
//  Created by Nami on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TypedValue.h"


@implementation TypedValue
@synthesize type, value;

-(TypedValue*) initWithType: (NSString*)_type value:(id)_value
{
	self.type = _type;
	self.value = _value;
	return self;
}

@end
