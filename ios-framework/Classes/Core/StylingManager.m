//
//  StylingManager.m
//  iPadFramework
//
//  Created by Nami on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StylingManager.h"
#import "iEmptyWidget.h"
#import "iWhen.h"


@implementation StylingManager

static BOOL _ordered;

+(BOOL) ordered
{
	return _ordered;
}

+(void) setOrdered:(BOOL)aBool
{
	_ordered = aBool;
}

+(float) getLeftAnchorStartingX: (float) lineY control:(iBaseControl*)control container: (iBaseControl*)parent
{
	float x = 0.0;
	
	NSMutableArray* flattenChildren = [parent getFlattenChildren];
	for (iBaseControl* subView in flattenChildren)
	{
		if ([subView isEqual:control])
			continue;
		if (!subView.visible)
			continue;
				
		CGRect frame = [subView getFrame];
		
		if (subView.anchor == Right || subView.anchor == LeftRight)
			continue;
		
		if (lineY >= frame.origin.y && lineY <= frame.origin.y + frame.size.height && subView.lineNo <= control.lineNo)
			if (frame.origin.x + frame.size.width + subView.marginRight >= x)
				x = frame.origin.x + frame.size.width + subView.marginRight;
	}
	[flattenChildren release];
	
	return x + control.marginLeft;
}

+(float)getRightAnchorEndingX: (float) lineY control:(iBaseControl*)control container: (iBaseControl*)parent
{
	CGRect parentFrame = [parent getFrame];
	
	float x = parentFrame.size.width;
	
	NSMutableArray* flattenChildren = [parent getFlattenChildren];
	for (iBaseControl* subView in flattenChildren)
	{
		if ([subView isEqual:control])
			continue;
		if (!subView.visible)
			continue;
		
		CGRect frame = [subView getFrame];
		
		if (subView.anchor != Right)
			continue;
		
		if (lineY >= frame.origin.y && lineY <= frame.origin.y + frame.size.height && subView.lineNo <= control.lineNo)
			if (frame.origin.x - subView.marginLeft <= x)
				x = frame.origin.x - subView.marginLeft;
	}
	[flattenChildren release];
	
	return x - control.marginRight;
}

+(float) calculateRawY:(iBaseControl*) control lastControl:(iBaseControl*)lastControl container:(iBaseControl*)parent
{
	CGRect lastControlFrame = [lastControl getFrame];
	
	float y = 0;
	if (control.place == NextLine)
	{
		float maxHeightOfLastLine = lastControlFrame.origin.y + lastControlFrame.size.height + lastControl.marginBottom;
		NSMutableArray* flattenChildren = [parent getFlattenChildren];
		for (iBaseControl* subView in flattenChildren)
		{
			if (subView.lineNo != lastControl.lineNo)
				continue;
			if (!subView.visible)
				continue;
			CGRect frame = [subView getFrame];
			if (frame.origin.y + frame.size.height + subView.marginBottom > maxHeightOfLastLine)
				maxHeightOfLastLine = frame.origin.y + frame.size.height + subView.marginBottom;
		}
		y = maxHeightOfLastLine; 
		[flattenChildren release];
	}
	else
		y = lastControlFrame.origin.y;
	
	return y;
	
}

+(float) calculateX:(iBaseControl*)control lastControl:(iBaseControl*)lastControl container:(iBaseControl*)parent
{
	CGRect lastControlFrame = [lastControl getFrame];
	
	float y = [self calculateRawY:control lastControl:lastControl container:parent];
	
	switch (control.anchor) {
		case None:
		{
			return lastControlFrame.origin.x;
		}
		case Left:
		{
			return [self getLeftAnchorStartingX:y control: control container:parent];
		}
		case Right:
		{
			return [self getRightAnchorEndingX:y control: control container:parent] - control.initialFrame.size.width;
		}
		case LeftRight:
		{
			return [self getLeftAnchorStartingX:y control: control container:parent];
		}
		default:
			return 0;
	}	
}


+(float) calculateY:(iBaseControl*) control lastControl:(iBaseControl*)lastControl container:(iBaseControl*)parent
{
	CGRect lastControlFrame = [lastControl getFrame];
	
	float y = [self calculateRawY:control lastControl:lastControl container:parent];
	if (control.place != NextLine)
		y = lastControlFrame.origin.y - lastControl.marginTop;
	return y + control.marginTop;
}

+(float) calculateWidth: (iBaseControl*)control container:(iBaseControl*)parent startingX:(float)startingX startingY:(float)startingY
{
	if (control.anchor != LeftRight)
		return control.initialFrame.size.width;
	
	float endingX = [self getRightAnchorEndingX:startingY control: control container:parent];
	
	return endingX - startingX;
}

+(float) calculateHeight: (iBaseControl*) control
{
	float lowestY = 0.0;
	
	NSMutableArray* flattenChildren = [control getFlattenChildren];
	for (iBaseControl* child in flattenChildren)
	{
		if (!child.visible)
			continue;
		CGRect frame = [child getFrame];
		if (child != NULL)
			if (frame.origin.y + frame.size.height >= lowestY)
				lowestY = frame.origin.y + frame.size.height;
	}
	[flattenChildren release];
	
	return lowestY;
}
									
+(CGRect) styleRectangle: (iBaseControl*)control container:(iBaseControl*)parent
{
	iBaseControl* lastControl = parent.lastInnerControl;
	
	float x = control.initialFrame.origin.x;
	float y = control.initialFrame.origin.y;
	
	float height = control.initialFrame.size.height;
	
	if (x == DEFAULT_X)
		x = [self calculateX:control lastControl:lastControl container:parent];
	
	if (y == DEFAULT_Y)
		y = [self calculateY:control lastControl:lastControl container:parent];
	
	float width =[self calculateWidth:control container:parent startingX:x startingY:y];

	if (height == DEFAULT_HEIGHT)
		height = [self calculateHeight:control];
	
	//TODO: This should be align for re-orientation
	if (y < VERTICAL_HEIGHT)
		if (y + height > VERTICAL_HEIGHT)
			height = VERTICAL_HEIGHT - y;

	return CGRectMake(x, y, width, height);
}

+(void) regenerateLineNos: (iBaseControl*) container
{
	NSMutableArray* flattenChildren = [container getFlattenChildren];
	
	int lineNo = 0;
	
	for (iBaseControl* child in flattenChildren)
	{
		if (child.place == NextLine)
			child.lineNo = ++lineNo;
		else
			child.lineNo = lineNo;
		
		[StylingManager regenerateLineNos:child];
	}
}

+(void) orderWidgets: (iBaseControl*)container
{
	container.lastInnerControl = [[iEmptyWidget alloc] init];
	NSMutableArray* flattenChildren = [container getFlattenChildren];
	for (iBaseControl* child in flattenChildren)
	{
		if (!child.visible)
			continue;
		[child setFrame:[self styleRectangle:child container:container]];
		CGRect f = [child getFrame];
		container.lastInnerControl = child;
		[StylingManager orderWidgets:child];
		
	}
	
	
	if (![StylingManager ordered]) {
		[StylingManager setOrdered:YES];
	}
	[flattenChildren release];
}

@end
