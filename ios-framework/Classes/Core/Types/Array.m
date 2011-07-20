//
//  Array.m
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Array.h"


@implementation Array
@synthesize length = _length;

-(Array*) init
{
	data = [[NSMutableArray alloc] init];
	length = [[BindableObject alloc] initWithNumber:0];
}

-(BindableObject*) length
{
	[_length setNumValue:[data count]];
	return _length;
}

@end
