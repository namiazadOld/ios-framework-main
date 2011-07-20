//
//  Scope.h
//  iPadFramework
//
//  Created by Nami on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Scope : NSObject {

	Scope* parent;
	NSMutableDictionary* variables;
}

@property (retain, nonatomic) Scope* parent;
@property (retain, nonatomic) NSMutableDictionary* variables;

-(void) assignRef: (NSString*)key value: (id) value;
-(void) assignNum: (NSString*)key value: (float) value;
-(void) assignBool: (NSString*)key value: (BOOL) value;
-(void) set: (NSString*)key variable: (NSObject*) variable;
-(NSObject*) get: (NSString*) key;
-(void) createInnerScope;
-(void) exitScope;
+(Scope*) instance;

@end
