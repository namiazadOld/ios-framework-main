//
//  Array.m
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Array.h"
#import "Num.h";


@implementation Array
@synthesize length = _length;

-(Array*) init
{
	data = [[NSMutableArray alloc] init];
	_length = [[BindableObject alloc] initializeWithValue:[[Num alloc] initWithNumber:0]];
	return self;
}

-(BindableObject*) length
{
	[(Num*)[_length value] setValue:[data count]];
	return _length;
}

@end
