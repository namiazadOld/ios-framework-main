//
//  iSection.m
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "section.h"
#import "NullObject.h"
#import "group.h"
#import "Utilities.h"
#import "Constants.h"
#import "empty.h"


@implementation section

@synthesize title, itemList, titleBindableObject, table;

-(group*) table
{
	baseControl* parent = self.parentWidget;
	
	while (parent != NULL && ![parent isKindOfClass:[group class]])
		parent = parent.parentWidget;
	
	return parent;
}

-(baseControl*) render: (NSMutableArray*)arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	[super render:arguments container: parent elements: elements];
	itemList = [[NSMutableArray alloc] init];
	
	[self renderElements:self];
	
	return self;
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		self.title = (NSString*)bo.value;
		[self.table childUpdated:self];
		self.locked = NO;
	}
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.titleBindableObject = bo;
			self.title = (NSString*)bo.value;
			break;
		case 1:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		default:
			break;
	}	
}


//This method is called by addBodyControl method of parent to provide good level of extensibility
-(void) parentChanged: (baseControl*)parent
{
	if ([parent isKindOfClass:[group class]])
	{
		group* _table = (group*)parent;
		[_table.sectionList addObject:self];		
		return;
	}
	
	//section can only be added to table
	[Utilities ShowError:self title:MSG_WRONG_SCREEN_STRUCTURE content:@"Section can only be added to a Table"];
	
}

-(void) childUpdated: (baseControl*)child
{
	[self.parentWidget childUpdated:child];
}



-(void) show
{
	[super show];
	[self.table childUpdated:self];
}

-(void) hide
{
	[super hide];
	[self.table childUpdated:self];
}

@end
