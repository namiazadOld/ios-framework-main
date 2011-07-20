//
//  iTimePicker.m
//  ipad-framework-main
//
//  Created by Nami on 6/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iTimePicker.h"


@implementation iTimePicker

-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	self.datePicker.datePickerMode = UIDatePickerModeTime;
	return self;
}

@end
