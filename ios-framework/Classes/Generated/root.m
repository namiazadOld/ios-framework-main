

#import "root.h"
#import "mobl_ipadstyle_buttonStyle.h"
#import "iButton.h"
#import "root_personListControl153.h"
#import "ControlVariable_Person.h"
#import "ControlVariable_Person.h"
#import "mobl_ipadstyle_buttonStyle.h"
#import "iButton.h"
#import "ControlVariable_addPerson.h"
#import "root.h"
#import "root_callback_tmp505.h"
#import "root_callback_tmp493.h"

@implementation root
@synthesize window;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	
	[window addSubview:[navController view]];
	
	[self.scope createInnerScope];
	int x_4105 = -1;
	
	NSStack* containerStack = [[NSStack alloc]init];
	[containerStack push:self];
	BindableObject* DeriveDecl92 = [[BindableObject alloc] initializeWithValue: 
	                                                                    [[NSSelector alloc] initWithSelector:@selector(action:) target:[[root_callback_tmp493 alloc] initWithScope:self.scope]]
	                                                                    ];
	[self.scope set:@"tmp493" variable:DeriveDecl92];
	BindableObject* DeriveDecl93 = [[BindableObject alloc] initializeWithValue: @"Add Person"];
	[self.scope set:@"tmp492" variable:DeriveDecl93];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments71 = [[NSMutableArray alloc] init];
	
	[arguments71 addObject:(BindableObject*)[self.scope get: @"tmp492"]];
	[arguments71 addObject:(BindableObject*)[self.scope get: @"tmp493"]];
	[arguments71 addObject:[[BindableObject alloc] initializeWithValue: [[mobl_ipadstyle_buttonStyle alloc] initialize]]];
	
	iButton* iButton_iButton8 = [[iButton alloc] init];
	[iButton_iButton8 render:arguments71 container: [containerStack top] elements:NULL];
	[iButton_iButton8 finilize];
	[[containerStack top] addBodyControl:iButton_iButton8];
	[self.scope exitScope];
	BindableObject* VarDeclInferred9 = [[BindableObject alloc] initializeWithValue: [[ControlVariable_Person all ] one ]];
	[self.scope set:@"p" variable:VarDeclInferred9];
	BindableObject* VarDeclInferred10 = [[BindableObject alloc] initializeWithValue: [ControlVariable_Person all ]];
	[self.scope set:@"personCollection" variable:VarDeclInferred10];
	BindableObject* VarDeclInferred11 = [[BindableObject alloc] initializeWithValue: [[(BindableObject*)[self.scope get: @"personCollection"] value] list ]];
	[self.scope set:@"personList" variable:VarDeclInferred11];
	BindableObject* DeriveDecl94 = [[BindableObject alloc] initializeWithValue: 
	                                                                    [[NSSelector alloc] initWithSelector:@selector(action:) target:[[root_callback_tmp505 alloc] initWithScope:self.scope]]
	                                                                    ];
	[self.scope set:@"tmp505" variable:DeriveDecl94];
	BindableObject* DeriveDecl95 = [[BindableObject alloc] initializeWithValue: @"Show Persons"];
	[self.scope set:@"tmp504" variable:DeriveDecl95];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments72 = [[NSMutableArray alloc] init];
	
	[arguments72 addObject:(BindableObject*)[self.scope get: @"tmp504"]];
	[arguments72 addObject:(BindableObject*)[self.scope get: @"tmp505"]];
	[arguments72 addObject:[[BindableObject alloc] initializeWithValue: [[mobl_ipadstyle_buttonStyle alloc] initialize]]];
	
	iButton* iButton_iButton9 = [[iButton alloc] init];
	[iButton_iButton9 render:arguments72 container: [containerStack top] elements:NULL];
	[iButton_iButton9 finilize];
	[[containerStack top] addBodyControl:iButton_iButton9];
	[self.scope exitScope];
	 
	[containerStack pop]; 
	[self.scope exitScope];
	[StylingManager orderWidgets:self];
	return self;
}
@end
