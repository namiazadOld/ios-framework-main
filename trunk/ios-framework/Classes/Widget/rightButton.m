//
//  iRightButton.m
//  iPadFramework
//
//  Created by Nami on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "rightButton.h"
#import "navBar.h"
#import "Utilities.h"
#import "Constants.h"

@implementation rightButton

-(void) parentChanged: (baseControl*)parent
{
	if ([parent isKindOfClass:[navBar class]])
	{
		navBar* _header = (navBar*)parent;
		self.navHdr = _header;
		_header.rightButton = self.button;
		return;
	}
	
	//rightButton can only be added to header and footer
	[Utilities ShowError:self title:MSG_WRONG_SCREEN_STRUCTURE content:@"Right Button can only be added to header and footer"];

}

-(void)show
{
	[super show];
	self.navHdr.rightButton = self.button;
	[self.navHdr setButtons];
}

-(void)hide
{
	[super show];
	self.navHdr.rightButton = NULL;
	[self.navHdr setButtons];
}

@end
