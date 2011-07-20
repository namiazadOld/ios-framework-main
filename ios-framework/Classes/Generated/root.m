

#import "root.h"
#import "mobl_ipadstyle_rightButtonStyle.h"
#import "iRightButton.h"
#import "ControlVariable_AddPerson.h"
#import "mobl_ipadstyle_headerStyle.h"
#import "iHeader.h"
#import "root.h"
#import "root_iHeader_ControlCall7.h"

@implementation root
@synthesize window;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	
	[window addSubview:[navController view]];
	
	[self.scope createInnerScope];
	int h_15723 = -1;
	
	NSStack* containerStack = [[NSStack alloc]init];
	[containerStack push:self];
	BindableObject* DeriveDecl39 = [[BindableObject alloc] initWithValue: @"General Infor"];
	[self.scope set:@"tmp117" variable:DeriveDecl39];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments27 = [[NSMutableArray alloc] init];
	
	[arguments27 addObject:(BindableObject*)[self.scope get: @"tmp117"]];
	[arguments27 addObject:[[BindableObject alloc] initWithValue: [[mobl_ipadstyle_headerStyle alloc] initialize]]];
	
	iHeader* iHeader_iHeader7 = [[iHeader alloc] init];
	[iHeader_iHeader7 render:arguments27 container: [containerStack top] elements:[[root_iHeader_ControlCall7 alloc] initWithElementOf:self.elementOf]];
	[iHeader_iHeader7 finilize];
	[[containerStack top] addBodyControl:iHeader_iHeader7];
	[self.scope exitScope];
	 
	[containerStack pop]; 
	[self.scope exitScope];
	[StylingManager orderWidgets:self];
	return self;
}
@end
