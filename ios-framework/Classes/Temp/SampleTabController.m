//
//  SampleTabController.m
//  iPadFramework
//
//  Created by Nami on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SampleTabController.h"


@implementation SampleTabController
@synthesize viewController;

UIDatePicker* datePicker;

-(void) initialize
{
	self.viewController = [[UIViewController alloc] init];

	//UIViewController* tabPage1 = [[UIViewController alloc] init];
//	tabPage1.title = @"Tab1";
//	UITextField* t = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 500, 300)];
//	t.borderStyle = UITextBorderStyleRoundedRect;
//	[tabPage1.view addSubview:t];
//	
//	UIViewController* tabPage2 = [[UIViewController alloc] init];
//	UITextField* t2 = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 500, 300)];
//	t2.borderStyle = UITextBorderStyleRoundedRect;
//	
//		
//
//	[tabPage2.view addSubview:t2];
//	[tabPage2.view addSubview:datePicker];
//	
//	
//	UITabBarController* tab = [[UITabBarController alloc] init];
//	tab.view.frame = CGRectMake(100, 100, 400, 700);
//	tab.title = @"MyTabController";
//	
//
//	NSArray* tabPages = [[NSArray alloc] initWithObjects:tabPage1, tabPage2, nil];
//	[tab setViewControllers:tabPages];
//	
//
//	UITextField* t3 = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 500, 300)];
//	t3.borderStyle = UITextBorderStyleRoundedRect;
//
//	[self.viewController.view addSubview:t3];
	
	datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(100, 300, 335, 216)];
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
    [components setYear:2005];
    [components setMonth:5];
    [components setDay:5];
	[components setHour:12];
	[components setMinute:45];
	[components setSecond:74];
	
	
	datePicker.date = [calendar dateFromComponents:components];
	
	datePicker.datePickerMode = UIDatePickerModeDate;
	
	UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(0, 0, 100, 100);
	[button setTitle:@"Click" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
	
	[self.viewController.view addSubview:datePicker];
	[self.viewController.view addSubview:button];
	
	
}

-(void) change:(id)sender
{
	if (datePicker.datePickerMode == UIDatePickerModeDateAndTime)
		datePicker.datePickerMode = UIDatePickerModeDate;
	else {
		datePicker.datePickerMode = UIDatePickerModeDateAndTime;
	}


}

@end
