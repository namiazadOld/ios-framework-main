

#import "root.h"
#import "mobl_ipadstyle_rightButtonStyle.h"
#import "iRightButton.h"

#import "mobl_ipadstyle_headerStyle.h"
#import "iHeader.h"
#import "root.h"


@implementation root
@synthesize window;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	
	[window addSubview:[navController view]];
	
	
	return self;
}
@end
