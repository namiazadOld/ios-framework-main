//
//  iWhen.m
//  ipad-framework-main
//
//  Created by Nami on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iWhen.h"
#import "StylingManager.h"
#import "NSStack.h"
#import "Utilities.h"


@implementation iWhen
@synthesize when, elseWhen, condition, conditionBindableObject;

-(BOOL) condition
{
	return self.visible;
}

-(void)setCondition:(BOOL)aBool
{
	@synchronized(self)
	{
		if (aBool)
		{
			[self.when show];
			[self.elseWhen hide];
		}
		else
		{
			[self.when hide];
			[self.elseWhen show];
		}
		
		if ([StylingManager ordered])
			[StylingManager orderWidgets:[self getRootContainer]];
	}
}

-(void) changeNotification:(BindableObject*) bo
{
	if (!self.locked)
	{
		self.locked = YES;
		if ([bo isEqual:self.conditionBindableObject])
		{
			[self setCondition:bo.boolValue];
		}
		self.locked = NO;
	}
}


-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[bo addListener:self];
	switch (index) {
		case 0:
			self.conditionBindableObject = bo;
			[self setCondition:bo.boolValue];
			break;
		default:
			break;
	}
}

-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container: parent elements: elements];
	iBaseControl* cr = [parent currentRole];
	[parent setCurrentRole:self];
	[self.scope createInnerScope];
	NSStack* containerStack = [[NSStack alloc] init];
    [containerStack push:parent];
	
	[self.scope createInnerScope];
	[self.when render:arguments container:parent elements:elements];
	[self.when finilize];
	[[containerStack top] addBodyControl:self.when];
	[self.scope exitScope];
	
	[self.scope createInnerScope];
	[self.elseWhen render:arguments container:parent elements:elements];
	[self.elseWhen finilize];
	[[containerStack top] addBodyControl:self.elseWhen];
	[self.scope exitScope];
	
	[containerStack pop];
	[self.scope exitScope];
	[parent setCurrentRole:cr];
	
	[self setCondition:self.conditionBindableObject.boolValue];
	return self;
}

-(void) addBodyControl:(iBaseControl*) widget
{	
	[Utilities AddControl:widget ToContainer:self];
}

-(void)show
{
	if (!self.parentWidget.visible)
		return;
	self.visible = YES;
	[self setCondition:self.conditionBindableObject.boolValue];
	
}


@end
