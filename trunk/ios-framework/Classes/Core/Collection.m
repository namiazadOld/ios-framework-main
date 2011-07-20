//
//  Collection.m
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Collection.h"


@implementation Collection

-(Collection*) init
{
	data = [[NSMutableArray alloc] init];
	return self;
}

-(void) add: (id)item
{
	[data addObject:item];
}


@end
