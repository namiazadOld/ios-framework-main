

#import "mobl_ipadstyle_tableStyle.h"
@implementation mobl_ipadstyle_tableStyle
	
	-(UIStyle*) initialize
	{
		[super initialize];
		
		self.left = -1;
		self.top = -1;
		self.width = 768;
		self.height = 1004;
		self.place = @"nextline";
		self.anchor = @"left-right";
		self.margin_left = 0;
		self.margin_right = 0;
		self.margin_top = 0;
		self.margin_bottom = 0;
		return self;
	}
@end
