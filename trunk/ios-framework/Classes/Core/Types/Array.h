//
//  Array.h
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



#import "BindableObject.h"
#import "Num.h"
#import "Bool.h"
#import "Function1.h"
#import "Generic.h"


@interface Array : Generic{
	NSMutableArray* data;
	BindableObject* _length;
}


@property (nonatomic, retain) BindableObject* length;
@property (nonatomic, retain) NSMutableArray* data;

-(NSObject*) get: (Num*) n;
-(void) push: (NSObject*) item;
-(NSString*) join: (NSString*) sep;
-(NSObject*) one;
-(Bool*) contains: (NSObject*) item;
-(Array*) splice: (Num*)idx arg:(Num*)numToDelete;
-(void) insert: (Num*) idx arg:(NSObject*)item;
-(void) remove: (NSObject*) item;
-(Array*) initWithObjects:(id)firstObj, ...
 NS_REQUIRES_NIL_TERMINATION;
-(Array*) filter: (Function1*)fn;

@end
