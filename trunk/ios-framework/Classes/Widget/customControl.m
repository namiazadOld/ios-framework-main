//
//  iCustomControl.m
//  iPadFramework
//
//  Created by Nami on 3/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "customControl.h"
#import "Constants.h"
#import "Utilities.h"


@implementation customControl
@synthesize container;


-(baseControl*) render: (NSMutableArray*)arguments container: (baseControl*)parent elements: (baseControl*) elements
{
	[super render:arguments container: parent elements: elements];
	self.container = parent;
	return self;
}

-(CGRect) getFrame
{
	//return [self.container getFrame];
	return CGRectMake(-1, -1, -1, -1);
}

-(void)setFrame:(CGRect)frame
{
	//[self.container setFrame:frame];
}

-(UIView*) getView
{
	//return [self.container getView];
	return NULL;
}

-(void) addBodyControl:(baseControl*) widget
{	
	[Utilities AddControl:widget ToContainer:self];
}

-(void) manageArgument:(BindableObject *)bo at:(int)index
{
	//hide super method
}

-(float) calculatedHeight
{
	float result = 0;
	
	for (baseControl* child in [self children])
		result += [child calculatedHeight];
	
	return result;
}


@end
