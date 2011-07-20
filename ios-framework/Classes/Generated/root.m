

#import "root.h"
#import "mobl_ipadstyle_buttonStyle.h"
#import "iButton.h"
#import "ControlVariable.h"
#import "mobl_ipadstyle_textBoxStyle.h"
#import "iNumField.h"
#import "mobl_ipadstyle_switchStyle.h"
#import "iSwitch.h"
#import "root.h"
#import "root_callback_tmp314.h"

@implementation root
@synthesize window;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	
	[window addSubview:[navController view]];
	
	[self.scope createInnerScope];
	int j_19250 = -1;
	
	NSStack* containerStack = [[NSStack alloc]init];
	[containerStack push:self];
	BindableObject* VarDeclInferred20 = [[BindableObject alloc] initializeWithValue: [[Num alloc] initWithNumber:10]];
	[self.scope set:@"n" variable:VarDeclInferred20];
	BindableObject* VarDeclInferred21 = [[BindableObject alloc] initializeWithValue: [[Bool alloc] initWithBool:YES]];
	[self.scope set:@"b" variable:VarDeclInferred21];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments70 = [[NSMutableArray alloc] init];
	
	[arguments70 addObject:(BindableObject*)[self.scope get: @"b"]];
	[arguments70 addObject:[[BindableObject alloc] initializeWithValue: [[mobl_ipadstyle_switchStyle alloc] initialize]]];
	
	iSwitch* iSwitch_iSwitch8 = [[iSwitch alloc] init];
	[iSwitch_iSwitch8 render:arguments70 container: [containerStack top] elements:NULL];
	[iSwitch_iSwitch8 finilize];
	[[containerStack top] addBodyControl:iSwitch_iSwitch8];
	[self.scope exitScope];
	BindableObject* DeriveDecl75 = [[BindableObject alloc] initializeWithValue: @""];
	[self.scope set:@"tmp312" variable:DeriveDecl75];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments71 = [[NSMutableArray alloc] init];
	
	[arguments71 addObject:(BindableObject*)[self.scope get: @"n"]];
	[arguments71 addObject:(BindableObject*)[self.scope get: @"tmp312"]];
	[arguments71 addObject:[[BindableObject alloc] initializeWithValue: [[mobl_ipadstyle_textBoxStyle alloc] initialize]]];
	
	iNumField* iNumField_iNumField15 = [[iNumField alloc] init];
	[iNumField_iNumField15 render:arguments71 container: [containerStack top] elements:NULL];
	[iNumField_iNumField15 finilize];
	[[containerStack top] addBodyControl:iNumField_iNumField15];
	[self.scope exitScope];
	BindableObject* DeriveDecl76 = [[BindableObject alloc] initializeWithValue: 
	                                                                    [[NSSelector alloc] initWithSelector:@selector(action:) target:[[root_callback_tmp314 alloc] initWithScope:self.scope]]
	                                                                    ];
	[self.scope set:@"tmp314" variable:DeriveDecl76];
	BindableObject* DeriveDecl77 = [[BindableObject alloc] initializeWithValue: @"Mul 2"];
	[self.scope set:@"tmp313" variable:DeriveDecl77];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments72 = [[NSMutableArray alloc] init];
	
	[arguments72 addObject:(BindableObject*)[self.scope get: @"tmp313"]];
	[arguments72 addObject:(BindableObject*)[self.scope get: @"tmp314"]];
	[arguments72 addObject:[[BindableObject alloc] initializeWithValue: [[mobl_ipadstyle_buttonStyle alloc] initialize]]];
	
	iButton* iButton_iButton4 = [[iButton alloc] init];
	[iButton_iButton4 render:arguments72 container: [containerStack top] elements:NULL];
	[iButton_iButton4 finilize];
	[[containerStack top] addBodyControl:iButton_iButton4];
	[self.scope exitScope];
	 
	[containerStack pop]; 
	[self.scope exitScope];
	[StylingManager orderWidgets:self];
	return self;
}
@end
