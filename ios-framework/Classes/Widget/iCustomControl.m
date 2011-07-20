//
//  iCustomControl.m
//  iPadFramework
//
//  Created by Nami on 3/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iCustomControl.h"
#import "Constants.h"
#import "Utilities.h"


@implementation iCustomControl
@synthesize container;


-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
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

-(void) addBodyControl:(iBaseControl*) widget
{	
	[Utilities AddControl:widget ToContainer:self];
}

-(void) manageArgument:(BindableObject *)bo at:(int)index
{
	//hide super method
}




@end
