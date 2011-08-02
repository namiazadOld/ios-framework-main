//
//  iTimePicker.m
//  ipad-framework-main
//
//  Created by Nami on 6/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "timepicker.h"


@implementation timepicker

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	self.datePicker.datePickerMode = UIDatePickerModeTime;
	return self;
}

@end
