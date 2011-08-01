//
//  Scope.h
//  iPadFramework
//
//  Created by Nami on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+mobl.h"
#import "NSObject+mobl.h"



@interface Scope : NSObject {

	Scope* parent;
	NSMutableDictionary* variables;
}

@property (retain, nonatomic) Scope* parent;
@property (retain, nonatomic) NSMutableDictionary* variables;

-(void) assign: (NSString*)key value: (NSObject*) _value;
-(void) set: (NSString*)key variable: (NSObject*) variable;
-(NSObject*) get: (NSString*) key;
-(void) createInnerScope;
-(void) exitScope;
+(Scope*) instance;

@end
