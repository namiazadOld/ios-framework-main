//
//  iTabPage.m
//  ipad-framework-main
//
//  Created by Nami on 5/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "tabpage.h"
#import "Utilities.h"


@implementation tabpage
@synthesize title, titleBindableObject, tabPage;

//Properties Wrappers
-(NSString*) title
{
	return tabPage.title;
}

-(void)setTitle:(NSString *)aString
{
	@synchronized(self)
	{
		if (tabPage.title != aString)
		{
			tabPage.title = [aString retain];
			[aString release];
		}
	}
}

-(baseControl*) render: (NSMutableArray*) arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.tabPage = [[UIViewController alloc] init];
	
	[super render:arguments container: parent elements: elements];
	return self;
}

-(void) eventOccured:(id)sender
{
	if (!self.locked)
	{
		self.locked = YES;
		[self.titleBindableObject setValue:self.tabPage.title];
		self.locked = NO;
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		if ([bo isEqual:self.titleBindableObject])
			self.tabPage.title = (NSString*) bo.value;
		self.locked = NO;
	}
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
			self.titleBindableObject = bo;
			self.tabPage.title = (NSString*)bo.value;
			break;
		case 1:
			//TODO: for Image
			break;
		case 2:
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		default:
			break;
	}
}

-(CGRect) getFrame
{
	return self.tabPage.view.frame;
}

-(void)setFrame:(CGRect)frame
{
	//Tabpage is a completely internal control and style managment should not be applied to that.
}

-(UIView*) getView
{
	return self.tabPage.view;
}

-(void) addBodyControl:(baseControl*) widget
{
	[Utilities AddControl:widget ToContainer:self];
}

-(id) getController
{
	return self.tabPage;
}

@end
