

#import "root.h"
#import "mobl_ipadstyle_rightButtonStyle.h"
#import "iRightButton.h"
#import "root_addPerson85.h"
#import "mobl_ipadstyle_headerStyle.h"
#import "iHeader.h"
#import "ControlVariable_personList.h"
#import "root.h"
#import "root_iHeader_ControlCall4.h"

@implementation root
@synthesize window;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	
	[window addSubview:[navController view]];
	
	[self.scope createInnerScope];
	int f_4934 = -1;
	
	NSStack* containerStack = [[NSStack alloc]init];
	[containerStack push:self];
	BindableObject* VarDeclInferred6 = [[BindableObject alloc] initializeWithValue: [[ControlVariable_personList alloc] init]];
	[self.scope set:@"content" variable:VarDeclInferred6];
	BindableObject* DeriveDecl14 = [[BindableObject alloc] initializeWithValue: @"Header"];
	[self.scope set:@"tmp56" variable:DeriveDecl14];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments20 = [[NSMutableArray alloc] init];
	
	[arguments20 addObject:(BindableObject*)[self.scope get: @"tmp56"]];
	[arguments20 addObject:[[BindableObject alloc] initializeWithValue: [[mobl_ipadstyle_headerStyle alloc] initialize]]];
	
	iHeader* iHeader_iHeader1 = [[iHeader alloc] init];
	[iHeader_iHeader1 render:arguments20 container: [containerStack top] elements:[[root_iHeader_ControlCall4 alloc] initWithElementOf:self.elementOf]];
	[iHeader_iHeader1 finilize];
	[[containerStack top] addBodyControl:iHeader_iHeader1];
	[self.scope exitScope];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments21 = [[NSMutableArray alloc] init];
	
	
	
	[[(BindableObject*)[self.scope get: @"content"] value] render:arguments21 container: [containerStack top] elements:NULL];
	[[(BindableObject*)[self.scope get: @"content"] value] finilize];
	[[containerStack top] addBodyControl:[(BindableObject*)[self.scope get: @"content"] value]];
	[self.scope exitScope];
	 
	[containerStack pop]; 
	[self.scope exitScope];
	[StylingManager orderWidgets:self];
	return self;
}
@end
