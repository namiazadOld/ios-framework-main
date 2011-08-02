//
//  iWhen.m
//  ipad-framework-main
//
//  Created by Nami on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "when.h"
#import "StylingManager.h"
#import "NSStack.h"
#import "Utilities.h"


@implementation when
@synthesize whn, elsewhn, condition, conditionBindableObject;

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
			[self.whn show];
			[self.elsewhn hide];
		}
		else
		{
			[self.whn hide];
			[self.elsewhn show];
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

-(baseControl*) render: (NSMutableArray*)arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	self.parentCache = parent;
	self.whn.parentCache = parent;
	self.elsewhn.parentCache = parent;
	
	self.elsewhn.index = self.whn.index = [parent.children count];
	self.elsewhn.isWhen = self.whn.isWhen = YES;

	
	//in set condition when or else based on the condition will be rendered. in show method of 
	//iBaseControl if the control has not been rendered, it will be rendered first.
	[super render:arguments container: parent elements: elements];
	baseControl* cr = [parent currentRole];
	[parent setCurrentRole:self];
	[self.scope createInnerScope];
	NSStack* containerStack = [[NSStack alloc] init];
    [containerStack push:parent];
	
		
	
	//if ([self.conditionBindableObject.value isTrue])
	//{
		[self.scope createInnerScope];
		[self.whn render:arguments container:parent elements:elements];
		[self.whn finilize];
		[[containerStack top] addBodyControl:self.whn];
		[self.scope exitScope];
	//}
	//else
	//{
		[self.scope createInnerScope];
		[self.elsewhn render:arguments container:parent elements:elements];
		[self.elsewhn finilize];
		[[containerStack top] addBodyControl:self.elsewhn];
		[self.scope exitScope];		
	//}
		
	[containerStack pop];
	[self.scope exitScope];
	[parent setCurrentRole:cr];
	
	[self setCondition:self.conditionBindableObject.value];


	return self;
}

-(void) addBodyControl:(baseControl*) widget
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
