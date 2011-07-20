//
//  CallBack.m
//  iPadFramework
//
//  Created by Nami on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Callback.h"


@implementation Callback
@synthesize scope;

-(Callback*) initWithScope: (Scope*)_scope
{
	self.scope = _scope;
	return self;
}

-(void) action: (id)sender
{
	
}

@end
