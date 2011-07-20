//
//  Entity.h
//  ipad-framework-main
//
//  Created by Nami on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Object.h"
#import "BindableObject.h"


@interface Entity : Object {
	NSString* id;
}

@property (retain, nonatomic) NSString* id;
+(NSEntityDescription*) createDescription: (NSString*)name;
-(void) sync: (NSManagedObject*)entity;
-(id) convert: (BindableObject*) prop;

+(void) all;

@end
