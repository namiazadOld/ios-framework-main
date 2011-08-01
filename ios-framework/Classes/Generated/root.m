

#import "root.h"
#import "ControlVariable_currentlineButtonStyle.h"
#import "iButton.h"
#import "ControlVariable_currentlineButtonStyle.h"
#import "iButton.h"
#import "ControlVariable_currentlineButtonStyle.h"
#import "iButton.h"
#import "mobl_ipadstyle_buttonStyle.h"
#import "iButton.h"
#import "root_test73.h"
#import "root_test73.h"
#import "mobl_ipadstyle_headerStyle.h"
#import "iHeader.h"
#import "root.h"
#import "root_callback_tmp1963.h"

@implementation root
@synthesize window;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	
	[window addSubview:[navController view]];
	
	[self.scope createInnerScope];
	int h_16270 = -1;
	
	NSStack* containerStack = [[NSStack alloc]init];
	[containerStack push:self];
	BindableObject* DeriveDecl646 = [[BindableObject alloc] initializeWithValue: @"Hello"];
	[self.scope set:@"tmp1960" variable:DeriveDecl646];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments608 = [[NSMutableArray alloc] init];
	
	[arguments608 addObject:(BindableObject*)[self.scope get: @"tmp1960"]];
	[arguments608 addObject:[[BindableObject alloc] initializeWithValue: [[mobl_ipadstyle_headerStyle alloc] initialize]]];
	
	iHeader* iHeader_iHeader37 = [[iHeader alloc] init];
	[iHeader_iHeader37 render:arguments608 container: [containerStack top] elements:NULL];
	[iHeader_iHeader37 finilize];
	[[containerStack top] addBodyControl:iHeader_iHeader37];
	[self.scope exitScope];
	BindableObject* VarDeclInferred162 = [[BindableObject alloc] initializeWithValue: [[root_test73 alloc] init]];
	[self.scope set:@"d" variable:VarDeclInferred162];
	BindableObject* DeriveDecl647 = [[BindableObject alloc] initializeWithValue: 
	                                                                    [[NSSelector alloc] initWithSelector:@selector(action:) target:[[root_callback_tmp1963 alloc] initWithScope:self.scope]]
	                                                                    ];
	[self.scope set:@"tmp1963" variable:DeriveDecl647];
	BindableObject* DeriveDecl648 = [[BindableObject alloc] initializeWithValue: @"Add"];
	[self.scope set:@"tmp1962" variable:DeriveDecl648];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments609 = [[NSMutableArray alloc] init];
	
	[arguments609 addObject:(BindableObject*)[self.scope get: @"tmp1962"]];
	[arguments609 addObject:(BindableObject*)[self.scope get: @"tmp1963"]];
	[arguments609 addObject:[[BindableObject alloc] initializeWithValue: [[mobl_ipadstyle_buttonStyle alloc] initialize]]];
	
	iButton* iButton_iButton106 = [[iButton alloc] init];
	[iButton_iButton106 render:arguments609 container: [containerStack top] elements:NULL];
	[iButton_iButton106 finilize];
	[[containerStack top] addBodyControl:iButton_iButton106];
	[self.scope exitScope];
	BindableObject* DeriveDecl649 = [[BindableObject alloc] initializeWithValue: @"Sub"];
	[self.scope set:@"tmp1964" variable:DeriveDecl649];
	BindableObject* DeriveDecl650 = [[BindableObject alloc] initializeWithValue: [[NullObject alloc] init]];
	[self.scope set:@"tmp1965" variable:DeriveDecl650];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments610 = [[NSMutableArray alloc] init];
	
	[arguments610 addObject:(BindableObject*)[self.scope get: @"tmp1964"]];
	[arguments610 addObject:(BindableObject*)[self.scope get: @"tmp1965"]];
	[arguments610 addObject:[[BindableObject alloc] initializeWithValue: [[ControlVariable_currentlineButtonStyle alloc] initialize]]];
	
	iButton* iButton_iButton107 = [[iButton alloc] init];
	[iButton_iButton107 render:arguments610 container: [containerStack top] elements:NULL];
	[iButton_iButton107 finilize];
	[[containerStack top] addBodyControl:iButton_iButton107];
	[self.scope exitScope];
	BindableObject* DeriveDecl651 = [[BindableObject alloc] initializeWithValue: @"Mul"];
	[self.scope set:@"tmp1966" variable:DeriveDecl651];
	BindableObject* DeriveDecl652 = [[BindableObject alloc] initializeWithValue: [[NullObject alloc] init]];
	[self.scope set:@"tmp1967" variable:DeriveDecl652];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments611 = [[NSMutableArray alloc] init];
	
	[arguments611 addObject:(BindableObject*)[self.scope get: @"tmp1966"]];
	[arguments611 addObject:(BindableObject*)[self.scope get: @"tmp1967"]];
	[arguments611 addObject:[[BindableObject alloc] initializeWithValue: [[ControlVariable_currentlineButtonStyle alloc] initialize]]];
	
	iButton* iButton_iButton108 = [[iButton alloc] init];
	[iButton_iButton108 render:arguments611 container: [containerStack top] elements:NULL];
	[iButton_iButton108 finilize];
	[[containerStack top] addBodyControl:iButton_iButton108];
	[self.scope exitScope];
	BindableObject* DeriveDecl653 = [[BindableObject alloc] initializeWithValue: @"Div"];
	[self.scope set:@"tmp1968" variable:DeriveDecl653];
	BindableObject* DeriveDecl654 = [[BindableObject alloc] initializeWithValue: [[NullObject alloc] init]];
	[self.scope set:@"tmp1969" variable:DeriveDecl654];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments612 = [[NSMutableArray alloc] init];
	
	[arguments612 addObject:(BindableObject*)[self.scope get: @"tmp1968"]];
	[arguments612 addObject:(BindableObject*)[self.scope get: @"tmp1969"]];
	[arguments612 addObject:[[BindableObject alloc] initializeWithValue: [[ControlVariable_currentlineButtonStyle alloc] initialize]]];
	
	iButton* iButton_iButton109 = [[iButton alloc] init];
	[iButton_iButton109 render:arguments612 container: [containerStack top] elements:NULL];
	[iButton_iButton109 finilize];
	[[containerStack top] addBodyControl:iButton_iButton109];
	[self.scope exitScope];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments613 = [[NSMutableArray alloc] init];
	
	
	
	[[(BindableObject*)[self.scope get: @"d"] value] render:arguments613 container: [containerStack top] elements:NULL];
	[[(BindableObject*)[self.scope get: @"d"] value] finilize];
	[[containerStack top] addBodyControl:[(BindableObject*)[self.scope get: @"d"] value]];
	[self.scope exitScope];
	 
	[containerStack pop]; 
	[self.scope exitScope];
	[StylingManager orderWidgets:self];
	return self;
}
@end
