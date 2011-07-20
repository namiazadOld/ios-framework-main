//
//  NSSelector.m
//  iPadFramework
//
//  Created by Nami on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSSelector.h"


@implementation NSSelector

@synthesize method, target;

-(NSSelector*) initWithSelector: (SEL) selector target:(id)_target
{
	self.method = selector;
	self.target = _target;
	return self;
}

@end
