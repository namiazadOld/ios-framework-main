//
//  iBaseControl.m
//  iPadFramework
//
//  Created by Nami on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BaseControl.h"
#import "Constants.h"
#import "NullObject.h"
#import "StylingManager.h"
#import "iView.h"
#import "iCustomControl.h"
#import "iWhen.h"

@implementation BaseControl
@synthesize locked, parentWidget, visible, isRendered, removeFromListener, parentCache,
			lastInnerControl, viewController, anchor, place, lineNo, index, isWhen,
			initialFrame, children, marginLeft, marginRight, marginTop, marginBottom, scope,
			currentRole, elementOf, elements, args;

-(BaseControl*) elementOf
{
	if ([self isKindOfClass:[iView class]])
		return NULL;
	if (elementOf == NULL)
		return self;
	return elementOf;
}

-(void) setRemoveFromListener:(BOOL)aBool
{
	removeFromListener = aBool;
	for(BaseControl* child in children)
		[child setRemoveFromListener:aBool];
}

-(Scope*) scope
{
	return [Scope instance];
}

-(void) setControlStyle: (UIStyle*) style
{
	initialFrame = CGRectMake(style.left, style.top, style.width, style.height);
	
	NSString* placeString = [[style place] lowercaseString];
	if ([placeString isEqualToString:@"currentline"])
		self.place = CurrentLine;
	else if ([placeString isEqualToString:@"nextline"])
		self.place = NextLine;

	
	NSString* anchorString = [[style anchor] lowercaseString];
	if ([anchorString isEqualToString:@"left"])
		self.anchor = Left;
	else if ([anchorString isEqualToString:@"right"])
		self.anchor = Right;
	else if ([anchorString isEqualToString:@"left-right"])
		self.anchor = LeftRight;
	else
		self.anchor = None;

	
	self.marginTop = style.margin_top;
	self.marginLeft = style.margin_left;
	self.marginRight = style.margin_right;
	self.marginBottom = style.margin_bottom;
}


-(BaseControl*) initWithElementOf: (BaseControl*)_elementOf
{
	[super init];
	self.elementOf = _elementOf;
	return self;
}

-(BaseControl*) render: (NSMutableArray*)arguments container: (BaseControl*)parent elements: (BaseControl*) _elements
{
	self.isRendered = YES;
	visible = YES;
	children = [[NSMutableArray alloc] init];
	initialFrame = CGRectMake(-1, -1, -1, -1);
	elements = _elements;
	
	if ([[self getChildrenHolder] respondsToSelector:@selector(addTarget:action:forControlEvents:)] && [self getChildrenHolder] != NULL)
		[[self getChildrenHolder] addTarget:self action:@selector(eventOccured:) forControlEvents:UIControlEventAllEvents];
	

	args = arguments;
	
	[self manageArguments:arguments container:parent];
	
	parent.lastInnerControl = self;

	return self;
}

-(void) renderElements: (BaseControl*)parent
{
	if (self.elements == NULL && self.elementOf.elements != NULL)
	{
		[self.elementOf.elements render: NULL container: parent elements:NULL];
		[parent addBodyControl:self.elementOf.elements];
	}
	else if (self.elements != NULL)
	{
		[self.elements render: NULL container: parent elements:NULL];
		[parent addBodyControl:self.elements];
	}
}

-(CGRect) getRecommendedFrame:(BaseControl*)parent
{
	return [StylingManager styleRectangle:self container:parent];
}

-(CGRect) getFrame
{
	return CGRectMake(0, 0, 0, 0);
}

-(void) setFrame: (CGRect)frame;
{
	
}

-(UIView*) getView;
{
	return NULL;
}

-(UIView*) getChildrenHolder
{
	return [self getView];
}

-(void)orientationChanged:(UIInterfaceOrientation)toInterfaceOrientation
{
	
}

-(void) addBodyControl:(BaseControl*) widget
{
	[widget parentChanged:self];
	
	if (self.currentRole != nil)
	{
		[self.currentRole.children addObject:widget];
		[widget setParentWidget:self.currentRole];
	}
	else
	{
		[self.children addObject:widget];
		[widget setParentWidget:self];
	}
	
	
}

-(void) finilize
{
	
}

-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	
}

-(void) parentChanged: (BaseControl*)parent
{
	
}

-(void) eventOccured: (id) sender
{

}

-(void) changeNotification:(BindableObject*) bo
{
	
}

-(void) manageArguments: (NSMutableArray*)arguments container: (BaseControl*)parent
{
	int i = 0;
	for (BindableObject* bo in arguments)
	{
		//if (bo.type == Null)
//		{
//			i++;
//			continue;
//		}
		if ([bo.value isKindOfClass:[NullObject class]])
		{
			i++;
			continue;
		}
		[self manageArgument:bo at:i];
		i++;
	}
	
	//lineNo management, should be located at better place
	if (self.place == NextLine)
	{
		if (parent.lastInnerControl == NULL)
			self.lineNo = 1;
		else
			self.lineNo = parent.lastInnerControl.lineNo + 1;
	}
	else
	{
		if (parent.lastInnerControl == NULL)
			self.lineNo = 0;
		else
			self.lineNo = parent.lastInnerControl.lineNo;
	}

}


-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[bo addListener:self];
}

-(void) childUpdated: (BaseControl*)child
{
	
}

-(void) hide
{
	self.visible = NO;
	if (![self isKindOfClass:[iCustomControl class]])
		[[self getView] setHidden:YES];
	for (BaseControl* control in self.children)
	{
		[control hide];
		if ([control getView] != NULL)
			[[control getView] setHidden:YES];
		[self childUpdated:control];
	}
}

-(void)show
{
	//if (self.isWhen && !self.isRendered)
//	{
//		[self.scope createInnerScope];
//		[self render:self.args container:self.parentCache elements:self.elements];
//		[self finilize];
//		[self.parentCache addBodyControl:self];
//		[self.scope exitScope];	
//		
//		[self.parentCache.children removeObject:self];
//		[self.parentCache.children insertObject:self atIndex:self.index];
//	}
	self.visible = YES;
	if (!parentWidget.visible)
		return;
	if (![self isKindOfClass:[iCustomControl class]])
		[[self getView] setHidden:NO];
	for (BaseControl* control in self.children)
	{
		[control show];
		if ([control getView] != NULL)
			[[control getView] setHidden:NO];
		[self childUpdated:control];
	}
}

-(BaseControl*) getRootContainer
{
	BaseControl* parent = self;
	while (parent.parentWidget != NULL)
		parent = parent.parentWidget;
	return parent;
}

-(NSMutableArray*) getFlattenChildren
{
	NSMutableArray* flattenChildren = [[NSMutableArray alloc] init];
	for (BaseControl* child in self.children)
	{
		if ([child isKindOfClass:[iCustomControl class]])
			[flattenChildren addObjectsFromArray:[child getFlattenChildren]];
		else
			[flattenChildren addObject:child];
	}
	return flattenChildren;
}

-(BaseControl*) getContainer
{
	BaseControl* parent = self.parentWidget;
	
	while (parent != NULL && [parent isKindOfClass:[iCustomControl class]])
		parent = parent.parentWidget;
	
	return parent;
}

-(void) setHeader: (iHeader*) header
{
	
}

-(float) calculatedHeight
{
	CGRect f = [self getFrame];
	return f.size.height;
}

-(id) getController
{
	return nil;
}

//+(void) PrintHierarchy:(UIView*) view
//{	
//	if (view == NULL)
//		return;
//	
//	
//	NSLog([[view class] description]);
//	for (UIView* child in view.subviews)
//		[iBaseControl PrintHierarchy:child];
//}
//+(void) PrintHierarchy2:(iBaseControl*) root level:(int)level
//{
//	NSMutableString* aString = [NSMutableString stringWithFormat:@"%d ", level];
//	CGRect f = [root getFrame];
//	[aString appendFormat:[[root class] description]];
//	[aString appendFormat:@" %f-%f-%f-%f", f.origin.x, f.origin.y, f.size.width, f.size.height];
//	NSLog(aString);
//	
//	for (iBaseControl* child in root.children)
//		[iBaseControl PrintHierarchy2:child level: level + 1];
//}

+(void) ChangeControl:(BaseControl*)source to:(BaseControl*)target
{

	if (!source.isRendered)
		return;
	
	BaseControl* container = [source getContainer];
	
	
	[source hide];
	int index = [source.parentWidget.children indexOfObject:source];
	[source.parentWidget.children removeObject:source];
	[source setRemoveFromListener:YES];
	
	if ([source.parentWidget isKindOfClass:[iCustomControl class]])
		container.currentRole = source.parentWidget;
	
	
	[target render:source.args container:container elements:NULL];
	[target finilize];
	[container addBodyControl:target];
	[target show];
	
	[source.parentWidget.children removeObject:target];
	[source.parentWidget.children insertObject:target atIndex:index];
	
	container.currentRole = NULL;
	
	if ([StylingManager ordered])
	{
		BaseControl* root = [target getRootContainer];
		[StylingManager regenerateLineNos:root];
		[StylingManager orderWidgets:root];
	}
	
	[source release];
	//[iBaseControl PrintHierarchy2:[target getRootContainer] level:0];
}

@end
