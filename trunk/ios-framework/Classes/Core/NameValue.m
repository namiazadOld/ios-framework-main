//
//  NameValue.m
//  ipad-framework-main
//
//  Created by Nami on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NameValue.h"


@implementation NameValue

@synthesize name, value;

-(NameValue*) initWithName: (NSString*)_name value:(id)_value
{
	self.name = _name;
	self.value = _value;
	return self;
}

@end
