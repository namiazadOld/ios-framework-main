

#import "mobl_ipadstyle_leftButtonStyle.h"
@implementation mobl_ipadstyle_leftButtonStyle
	
	-(UIStyle*) initialize
	{
		[super initialize];
		
		self.left = -1;
		self.top = -1;
		self.width = 72;
		self.height = 37;
		self.place = @"nextline";
		self.anchor = @"left";
		self.margin_left = 5;
		self.margin_right = 5;
		self.margin_top = 5;
		self.margin_bottom = 5;
		return self;
	}
@end
