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

Bool* conditionCache;



-(Bool*) condition
{
	if (conditionCache == NULL)
		conditionCache = [[Bool alloc] initWithBool:self.visible];
	
	conditionCache.value = self.visible;
	return conditionCache;
}

-(void)setCondition:(Bool*)aBool
{
	@synchronized(self)
	{
		if (aBool.value)
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
			[self setCondition:bo.value];
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
			[self setCondition:bo.value];
			break;
		default:
			break;
	}
}

-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	self.parentCache = parent;
	self.when.parentCache = parent;
	self.elseWhen.parentCache = parent;
	
	//in set condition when or else based on the condition will be rendered. in show method of 
	//iBaseControl if the control has not been rendered, it will be rendered first.
	[super render:arguments container: parent elements: elements];
	iBaseControl* cr = [parent currentRole];
	[parent setCurrentRole:self];
	[self.scope createInnerScope];
	NSStack* containerStack = [[NSStack alloc] init];
    [containerStack push:parent];
	
	self.elseWhen.index = self.when.index = [parent.children count];
	self.elseWhen.isWhen = self.when.isWhen = YES;
	
	
	//if ([self.conditionBindableObject.value isTrue])
//	{
//		[self.scope createInnerScope];
//		[self.when render:arguments container:parent elements:elements];
//		[self.when finilize];
//		[[containerStack top] addBodyControl:self.when];
//		[self.scope exitScope];
//	}
//	else
//	{
//		[self.scope createInnerScope];
//		[self.elseWhen render:arguments container:parent elements:elements];
//		[self.elseWhen finilize];
//		[[containerStack top] addBodyControl:self.elseWhen];
//		[self.scope exitScope];		
//	}
		
	[containerStack pop];
	[self.scope exitScope];
	[parent setCurrentRole:cr];
	
	[self setCondition:self.conditionBindableObject.value];


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
	[self setCondition:self.conditionBindableObject.value];
	
}

@end
