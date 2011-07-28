

#import "root.h"
#import "ControlVariable_nextlineTextBoxStyle.h"
#import "iNumField.h"
#import "ControlVariable_Person.h"
#import "root.h"
#import "root_tmp17_evaluator.h"

@implementation root
@synthesize window;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements
{
	[super render:arguments container:parent elements: elements];
	
	[window addSubview:[navController view]];
	
	[self.scope createInnerScope];
	int d_10599 = -1;
	
	NSStack* containerStack = [[NSStack alloc]init];
	[containerStack push:self];
	
	root_tmp17_evaluator* DeriveDecl40 = [[root_tmp17_evaluator alloc] initWithScope:self.scope];
	BindableObject* DeriveDecl4 = [[BindableObject alloc] initializeWithValue: [DeriveDecl40 evaluate]];
	[self.scope set:@"tmp17" variable:DeriveDecl4];
	DeriveDecl4.evaluator = DeriveDecl40;
	
	BindableObject* DeriveDecl5 = [[BindableObject alloc] initializeWithValue: @""];
	[self.scope set:@"tmp18" variable:DeriveDecl5];
	
	[self.scope createInnerScope];
	
	NSMutableArray* arguments2 = [[NSMutableArray alloc] init];
	
	[arguments2 addObject:(BindableObject*)[self.scope get: @"tmp17"]];
	[arguments2 addObject:(BindableObject*)[self.scope get: @"tmp18"]];
	[arguments2 addObject:[[BindableObject alloc] initializeWithValue: [[ControlVariable_nextlineTextBoxStyle alloc] initialize]]];
	
	iNumField* iNumField_iNumField1 = [[iNumField alloc] init];
	[iNumField_iNumField1 render:arguments2 container: [containerStack top] elements:NULL];
	[iNumField_iNumField1 finilize];
	[[containerStack top] addBodyControl:iNumField_iNumField1];
	[self.scope exitScope];
	 
	[containerStack pop]; 
	[self.scope exitScope];
	[StylingManager orderWidgets:self];
	return self;
}
@end
