//
//  Array.h
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "Object.h"
#import "BindableObject.h"
#import "Num.h"
#import "String.h"
#import "Bool.h"


@interface Array : Object{
	NSMutableArray* data;
	BindableObject* _length;
}


@property (nonatomic, retain) BindableObject* length;

-(Object*) get: (Num*) n;
-(void) push: (Object*) item;
-(String*) join: (String*) sep;
-(Object*) one;
-(Bool*) contains: (Object*) item;
-(Array*) splice: (Num*)idx arg:(Num*)numToDelete;
-(void) insert: (Num*) idx arg:(Object*)item;

@end
