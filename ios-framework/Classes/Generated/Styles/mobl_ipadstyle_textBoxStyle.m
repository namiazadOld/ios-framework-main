

#import "mobl_ipadstyle_textBoxStyle.h"
@implementation mobl_ipadstyle_textBoxStyle
	@synthesize border_style ;
	-(UIStyle*) initialize
	{
		[super initialize];
		
		self.left = -1;
		self.top = -1;
		self.width = 100;
		self.height = 31;
		self.place = @"currentline";
		self.anchor = @"left-right";
		self.margin_left = 5;
		self.margin_right = 5;
		self.margin_top = 5;
		self.margin_bottom = 5;
		self.border_style = @"bordered";
		return self;
	}
@end
