

#import "mobl_ipadstyle_switchStyle.h"
@implementation mobl_ipadstyle_switchStyle
	
	-(UIStyle*) initialize
	{
		[super initialize];
		
		self.left = -1;
		self.top = -1;
		self.width = 94;
		self.height = 27;
		self.place = @"currentline";
		self.anchor = @"right";
		self.margin_left = 5;
		self.margin_right = 5;
		self.margin_top = 5;
		self.margin_bottom = 5;
		return self;
	}
@end
