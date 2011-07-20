//
//  iSection.m
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iSection.h"
#import "NullObject.h"
#import "iTable.h"
#import "Utilities.h"
#import "Constants.h"
#import "iEmptyWidget.h"


@implementation iSection

@synthesize title, itemList, titleBindableObject, table;

-(iTable*) table
{
	iBaseControl* parent = self.parentWidget;
	
	while (parent != NULL && ![parent isKindOfClass:[iTable class]])
		parent = parent.parentWidget;
	
	return parent;
}

-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
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
-(void) parentChanged: (iBaseControl*)parent
{
	if ([parent isKindOfClass:[iTable class]])
	{
		iTable* _table = (iTable*)parent;
		[_table.sectionList addObject:self];		
		return;
	}
	
	//section can only be added to table
	[Utilities ShowError:self title:MSG_WRONG_SCREEN_STRUCTURE content:@"Section can only be added to a Table"];
	
}

-(void) childUpdated: (iBaseControl*)child
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
