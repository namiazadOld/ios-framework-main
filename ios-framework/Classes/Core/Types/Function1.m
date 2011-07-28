//
//  Function1.m
//  ios-framework
//
//  Created by Nami on 7/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Function1.h"


@implementation Function1
@synthesize className, method;

-(Function1*) initWithInstance: (NSString*)_className method: (SEL) _method
{
	className = _className;
	method = _method;
	return self;
}

-(NSObject*) invoke: (id)param
{
	
	return [NSClassFromString(self.className) performSelector:self.method];
}

@end
