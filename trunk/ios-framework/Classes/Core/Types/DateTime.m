//
//  CustomDate.m
//  ipad-framework-main
//
//  Created by Nami on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DateTime.h"
#import "String.h"
#import "Num.h"

@implementation DateTime
@synthesize _date;

+(DateTime*) create: (Num*)year arg:(Num*)month arg:(Num*)day arg:(Num*)hour arg:(Num*)minute arg:(Num*)second arg:(Num*)ms
{
	DateTime* d = [[DateTime alloc] init];
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    [components setYear:year.value];
    [components setMonth:month.value];
    [components setDay:day.value];
	[components setHour:hour.value];
	[components setMinute:minute.value];
	[components setSecond:second.value];
	
	d._date = [calendar dateFromComponents:components];

	return d;
}

+(DateTime*) parse: (NSString*)s
{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"EEE, dd MMM yy HH:mm:ss VVVV"];
	NSDate* myDate = [df dateFromString:s];
	
	DateTime* result = [[DateTime alloc] init];
	result._date = myDate;
	return result;
}

+(NSDate*) getStartingDate
{
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    [components setYear:1970];
    [components setMonth:1];
    [components setDay:1];
	[components setHour:0];
	[components setMinute:0];
	[components setSecond:0];
	
	return [calendar dateFromComponents:components];
	
}

+(DateTime*) fromTimestamp: (Num*)timestamp
{
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.value];
	DateTime* result = [[DateTime alloc] init];
	result._date = date;
	return result;
}

-(Num*) getFullYear
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self._date];
	return [[Num alloc] initWithNumber:[components year]];
}

-(Num*) getMonth
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self._date];
	return [[Num alloc] initWithNumber:[components month]];
}

-(Num*) getDate
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self._date];
	return [[Num alloc] initWithNumber:[components day]];
}

-(Num*) getDay
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self._date];
	return [[Num alloc] initWithNumber:[components weekday]];
}

-(Num*) getHours
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self._date];
	return [[Num alloc] initWithNumber:[components hour]];
}

-(Num*) getMinutes
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self._date];
	return [[Num alloc] initWithNumber:[components minute]];
}

-(Num*) getSeconds
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self._date];
	return [[Num alloc] initWithNumber:[components second]];
}

-(Num*) getMilliseconds
{
	return [[Num alloc] initWithNumber:0];
}

-(Num*) setFullYear: (Num*) y
{	
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    [components setYear:y.value];
    [components setMonth:[[self getMonth] value]];
    [components setDay:[[self getDay] value]];
	[components setHour:[[self getHours] value]];
	[components setMinute:[[self getMinutes] value]];
	[components setSecond:[[self getSeconds] value]];
	
	self._date = [calendar dateFromComponents:components];
	return y;
	
}

-(Num*) setMonth: (Num*) m
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    [components setYear:[[self getFullYear] value]];
    [components setMonth:m.value];
    [components setDay:[[self getDay] value]];
	[components setHour:[[self getHours] value]];
	[components setMinute:[[self getMinutes] value]];
	[components setSecond:[[self getSeconds] value]];
	
	self._date = [calendar dateFromComponents:components];
	return m;
}

-(Num*) setDate: (Num*) d
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    [components setYear:[[self getFullYear] value]];
    [components setMonth:[[self getMonth] value]];
    [components setDay:d.value];
	[components setHour:[[self getHours] value]];
	[components setMinute:[[self getMinutes] value]];
	[components setSecond:[[self getSeconds] value]];
	
	self._date = [calendar dateFromComponents:components];
	return d;
}

-(NSString*) toString
{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"EEE, dd MMM yy HH:mm:ss VVVV"];
	return [df stringFromDate:self._date];
}

-(NSString*) toDateString
{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"dd/MM/yyyy"];
	return [df stringFromDate:self._date];
}


-(Num*) getTime
{
	float f = [self._date timeIntervalSince1970];
	return [[Num alloc] initWithNumber:f];
}

-(BOOL) isEqual:(id)object
{
	DateTime* obj = (DateTime*)object;
	return [self._date isEqual:obj._date];
}

-(Bool*) e: (NSObject*) n
{
	if (![n isKindOfClass:[DateTime class]])
		return [[Bool alloc] initWithBool:NO];
	DateTime* input = (DateTime*)n;
	return [[Bool alloc] initWithBool:[self._date isEqualToDate:input._date]];
}

-(Bool*) ne: (NSObject*) n
{
	if (![n isKindOfClass:[DateTime class]])
		return [[Bool alloc] initWithBool:YES];
	DateTime* input = (DateTime*)n;
	return [[Bool alloc] initWithBool:![self._date isEqualToDate:input._date]];
}


@end
