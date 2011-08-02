//
//  iDateTimePicker.m
//  ipad-framework-main
//
//  Created by Nami on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "datepicker.h"

//TODO: Show Time does not work properly.
@implementation datepicker
@synthesize datePicker, date = _date, dateBindableObject;// showTimeBindableObject, showTime;

-(DateTime*) date
{
	if (_date == NULL)
		_date = [[DateTime alloc] init];
	_date._date = datePicker.date;
	return _date;
}

-(void)setDate:(DateTime *)aDate
{
	@synchronized(self)
	{
		if (![[self.datePicker date] isEqualToDate:aDate._date])
			[self.datePicker setDate:aDate._date];
	}
}

//-(BOOL) showTime
//{
//	return (self.datePicker.datePickerMode == UIDatePickerModeDateAndTime);
//}
//
//-(void)setShowTime:(BOOL)aBool
//{
//	if (aBool)
//		[self.datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
//	else
//		[self.datePicker setDatePickerMode:UIDatePickerModeDate];
//	
//
//}

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.datePicker = [[UIDatePicker alloc] init];
	[super render:arguments container: parent elements: elements];
	self.datePicker.datePickerMode = UIDatePickerModeDate;
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		
		[self.dateBindableObject.value release];
		DateTime* dt = [[DateTime alloc] init];
		dt._date = [self.datePicker.date retain];
		[self.dateBindableObject setValue:dt];
		
		//[self.showTimeBindableObject setBoolValue:(datePicker.datePickerMode == UIDatePickerModeDateAndTime)];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		if ([bo isEqual:self.dateBindableObject])
			[self setDate:(DateTime*)bo.value];
		//else
//			[self setShowTime:bo.boolValue];
		self.locked = NO;
	}
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.dateBindableObject = bo;
			[self setDate:(DateTime*)bo.value];
			break;
		//case 1:
//			self.showTimeBindableObject = bo;
//			[self setShowTime:bo.boolValue];
//			break;
		case 1:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		default:
			break;
	}
}

-(CGRect) getFrame
{
	return self.datePicker.frame;
}

-(void)setFrame:(CGRect)frame
{
	self.datePicker.frame = frame;
}

-(UIView*) getView
{
	return self.datePicker;
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	[self.datePicker addTarget:target action:action forControlEvents:controlEvents];
}



@end
