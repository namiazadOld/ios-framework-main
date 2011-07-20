//
//  CustomDate.m
//  ipad-framework-main
//
//  Created by Nami on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DateTime.h"


@implementation DateTime
@synthesize date;

+(DateTime*) create: (float)year arg:(float)month arg:(float)day arg:(float)hour arg:(float)minute arg:(float)second arg:(float)ms
{
	DateTime* d = [[DateTime alloc] init];
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
	[components setHour:hour];
	[components setMinute:minute];
	[components setSecond:second];
	
	d.date = [calendar dateFromComponents:components];

	return d;
}

-(float) getDay
{
	return 0;
}

@end
