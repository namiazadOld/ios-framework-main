

#import "root.h"
#import "mobl_ipadstyle_rightButtonStyle.h"
#import "iRightButton.h"
#import "ControlVariable_AddPerson.h"
#import "mobl_ipadstyle_headerStyle.h"
#import "iHeader.h"
#import "root.h"
#import "root_iHeader_ControlCall5.h"

@implementation root
@synthesize window;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	
	[window addSubview:[navController view]];
	
	[self.scope createInnerScope];
	int n_7629 = -1;
	
	NSStack* containerStack = [[NSStack alloc]init];
	[containerStack push:self];
	BindableObject* DeriveDecl9 = [[BindableObject alloc] initWithValue: @"General Infor"];
	[self.scope set:@"tmp21" variable:DeriveDecl9];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments6 = [[NSMutableArray alloc] init];
	
	[arguments6 addObject:(BindableObject*)[self.scope get: @"tmp21"]];
	[arguments6 addObject:[[BindableObject alloc] initWithValue: [[mobl_ipadstyle_headerStyle alloc] initialize]]];
	
	iHeader* iHeader_iHeader1 = [[iHeader alloc] init];
	[iHeader_iHeader1 render:arguments6 container: [containerStack top] elements:[[root_iHeader_ControlCall5 alloc] initWithElementOf:self.elementOf]];
	[iHeader_iHeader1 finilize];
	[[containerStack top] addBodyControl:iHeader_iHeader1];
	[self.scope exitScope];
	 
	[containerStack pop]; 
	[self.scope exitScope];
	[StylingManager orderWidgets:self];
	return self;
}
@end
