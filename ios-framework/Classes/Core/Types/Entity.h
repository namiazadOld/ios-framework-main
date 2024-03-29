//
//  Entity.h
//  ipad-framework-main
//
//  Created by Nami on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "BindableObject.h"
#import "NSObject+mobl.h"
#import "NSString+mobl.h"
#import "Generic.h"
@class Collection;

@interface Entity : Generic{
	NSString* id;
	NSManagedObjectID* eId;
}

@property (retain, nonatomic) NSString* id;
@property (retain, nonatomic) NSManagedObjectID* eId;


+(NSEntityDescription*) createDescription: (NSString*)name;
-(void) sync: (NSManagedObject*)entity;
-(void) reSync: (NSManagedObject*)entity;
-(id) convert: (BindableObject*) prop;
-(NSObject*) reConvert: (id) attr;

+(Collection*) all;

@end
