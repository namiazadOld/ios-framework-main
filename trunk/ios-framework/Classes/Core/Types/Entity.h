//
//  Entity.h
//  ipad-framework-main
//
//  Created by Nami on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "BindableObject.h"
#import "NSObject+mobl.h"
#import "Generic.h"
@class Collection;

@interface Entity : Generic{
	NSString* id;
}

@property (retain, nonatomic) NSString* id;
+(NSEntityDescription*) createDescription: (NSString*)name;
-(void) sync: (NSManagedObject*)entity;
-(void) reSync: (NSManagedObject*)entity;
-(id) convert: (BindableObject*) prop;
-(BindableObject*) reConvert: (id) attr

+(Collection*) all;

@end
