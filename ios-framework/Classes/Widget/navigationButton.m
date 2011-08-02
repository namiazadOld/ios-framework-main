//
//  iNavigationButton.m
//  iPadFramework
//
//  Created by Nami on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "navigationButton.h"
#import "NullObject.h"
#import "NSSelector.h"
#import "widgetHolder.h"


@implementation navigationButton

@synthesize button, titleBindableObject, navHdr, contextMenu;

//Properties Wrappers
-(NSString*) title
{
	return button.title;
}

-(void)setTitle:(NSString *)aString
{
	@synchronized(self)
	{
		if (button.title != aString)
		{
			[button setTitle:[aString retain]];
			[aString release];
		}
	}
}


-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.button = [[UIBarButtonItem alloc] init];
	[self.button setStyle:UIBarButtonSystemItemFastForward];
	[super render:arguments container: parent elements: elements];
	
	
	
	
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.titleBindableObject setValue:[self.button.title retain]];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.button setTitle:(NSString*)bo.value];
		self.locked = NO;
	}
}

-(void) initializeContexMenu: (customControl*) content
{
	widgetHolder* view = [[widgetHolder alloc] init];
	[view render:[[NSMutableArray alloc] init] container:NULL elements:NULL];
	view.viewController.view.backgroundColor = [UIColor whiteColor];
	
	[content render:[[NSMutableArray alloc] init] container:view elements:NULL];
	[content finilize];
	[view addBodyControl:content];
	
	view.viewController.view.frame = CGRectMake(0, 0, 200, [content calculatedHeight]);
	
	self.contextMenu = [[UIPopoverController alloc] initWithContentViewController:view.viewController];
	self.contextMenu.delegate = self.button;
	[self.button setAction:@selector(showContextMenu)];
	[self.button setTarget:self];
}

-(void) showContextMenu
{
	self.contextMenu.popoverContentSize = self.contextMenu.contentViewController.view.frame.size;
	if (self.contextMenu.popoverContentSize.height > 300)
		self.contextMenu.popoverContentSize = CGSizeMake(self.contextMenu.popoverContentSize.width, 300);
	[self.contextMenu presentPopoverFromBarButtonItem:self.button
					 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) manageArgument: (BindableObject*)bo at:(int)_index
{
	[super manageArgument:bo at:index];
	switch (_index) {
		case 0:
			titleBindableObject = bo;
			[self.button setTitle:(NSString*)bo.value];
			break;
		case 1:
		{
			[self initializeContexMenu:(customControl*)bo.value];
			break;
		}
		case 2:
		{
			NSSelector* methodSelector = (NSSelector*)bo.value;
			[self addTarget: methodSelector.target action: methodSelector.method forControlEvents:UIControlEventTouchUpInside];
			break;
		}
		case 3:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		default:
			break;
	}
}


-(CGRect) getFrame
{
	return CGRectMake(0.0, 0.0, self.button.width, 0.0);
}

-(void)setFrame:(CGRect)frame
{
	[self.button setWidth:frame.size.width];
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	[self.button setAction:action];
	[self.button setTarget:target];
}

@end
