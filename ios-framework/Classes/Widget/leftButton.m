//
//  iLeftButton.m
//  iPadFramework
//
//  Created by Nami on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "leftButton.h"
#import "navBar.h"
#import "Utilities.h"
#import "Constants.h"


@implementation leftButton

-(void) parentChanged: (baseControl*)parent
{
	if ([parent isKindOfClass:[navBar class]])
	{
		navBar* _header = (navBar*)parent;
		_header.leftButton = self.button;
		
		self.navHdr = _header;
		
		return;
	}
	
	//leftButton can only be added to header and footer
	[Utilities ShowError:self title:MSG_WRONG_SCREEN_STRUCTURE content:@"Left Button can only be added to header and footer"];
	
}

-(void)show
{
	[super show];
	self.navHdr.leftButton = self.button;
	[self.navHdr setButtons];
}

-(void)hide
{
	[super show];
	self.navHdr.leftButton = NULL;
	[self.navHdr setButtons];
}

@end
