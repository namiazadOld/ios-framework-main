//
//  Evaluator.m
//  ipad-framework-main
//
//  Created by Nami on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Evaluator.h"


@implementation Evaluator
@synthesize scope;

-(Evaluator*) initWithScope: (Scope*)_scope
{
	self.scope = _scope;
	return self;
}

-(float) evaluateNum
{
	return 0;
}

-(BOOL) evaluateBool
{
	return YES;
}

-(id) evaluate
{
	return NULL;
}

@end
