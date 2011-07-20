//
//  iLeftButton.m
//  iPadFramework
//
//  Created by Nami on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iLeftButton.h"
#import "iHeader.h"
#import "Utilities.h"
#import "Constants.h"


@implementation iLeftButton

-(void) parentChanged: (iBaseControl*)parent
{
	if ([parent isKindOfClass:[iHeader class]])
	{
		iHeader* _header = (iHeader*)parent;
		_header.leftButton = self.button;
		
		self.header = _header;
		
		return;
	}
	
	//leftButton can only be added to header and footer
	[Utilities ShowError:self title:MSG_WRONG_SCREEN_STRUCTURE content:@"Left Button can only be added to header and footer"];
	
}

-(void)show
{
	[super show];
	self.header.leftButton = self.button;
	[self.header setButtons];
}

-(void)hide
{
	[super show];
	self.header.leftButton = NULL;
	[self.header setButtons];
}

@end
