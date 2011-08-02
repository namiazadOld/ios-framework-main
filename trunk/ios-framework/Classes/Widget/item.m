//
//  iItem.m
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "item.h"
#import "NullObject.h"
#import "section.h"
#import "group.h"
#import "Utilities.h"
#import "empty.h"


@implementation item

@synthesize title, cell, titleBindableObject, table, onClick;

-(group*) table
{
	baseControl* parent = self.parentWidget;
	
	while (parent != NULL && ![parent isKindOfClass:[group class]])
		parent = parent.parentWidget;
	
	return parent;
}

-(baseControl*) render: (NSMutableArray*)arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] autorelease];
	[super render:arguments container: parent elements: elements];
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
			titleBindableObject = bo;
			self.title = (NSString*)bo.value;
			break;
		case 1:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		case 2:
			self.onClick = (NSSelector*)bo.value;
		default:
			break;
	}
}


//This method is called by addBodyControl method of parent to provide good level of extensibility
-(void) parentChanged: (baseControl*)parent
{
	if ([parent isKindOfClass:[section class]])
	{
		section* sec = (section*)parent;
		[sec.itemList addObject:self];
		return;
	}
	
	if ([parent isKindOfClass:[group class]])
	{
		section* sec;
		group* _table = (group*)parent;
		if ([_table.sectionList count] == 0)
		{
			sec = [[section alloc] init];
			[sec render:[[NSMutableArray alloc] init] container:_table elements:NULL];
			[_table.sectionList addObject:sec];
		}
		
		sec = [_table.sectionList objectAtIndex:0];
		[sec.itemList addObject:self];
		return;
	}
}

-(void) addBodyControl:(baseControl*) widget
{
	[Utilities AddControl:widget ToContainer:self];
}

-(CGRect) getFrame
{
	return self.cell.contentView.frame;
}

-(UIView*) getView
{
	return self.cell;
}

-(UIView*) getChildrenHolder
{
	return self.cell.contentView;
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
