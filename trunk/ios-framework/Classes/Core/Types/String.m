//
//  String.m
//  ipad-framework-main
//
//  Created by Nami on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "String.h"


@implementation String
@synthesize value;

-(String*) initWithString: (NSString*)input
{
	value = input;
	return self;
}

-(String*) toString
{
	return self;
}
@end
