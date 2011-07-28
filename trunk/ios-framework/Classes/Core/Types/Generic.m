//
//  Generic.m
//  ios-framework
//
//  Created by Nami on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Generic.h"


@implementation Generic
@synthesize typeName;

-(Generic*) initWithTypeName: (NSString*) _typeName
{
	typeName = _typeName;
	return self;
}

@end
