//
//  BindableObject.h
//  iPadFramework
//
//  Created by Nami on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Notifiable.h"
#import "NSSelector.h"
#import "Evaluator.h"



typedef enum 
{
	Null = 0,
	Num = 1,
	Bool = 2,
	Ref = 3
} ValueType;


@interface BindableObject : NSObject<Notifiable> {
	id value;
	float numValue;
	BOOL boolValue;
	ValueType type;
	NSMutableArray* listeners;
	Evaluator* evaluator;
	BOOL removeFromListener;
}

@property (retain, readwrite) id value;
@property (assign, readwrite) float numValue;
@property (assign, readwrite) BOOL boolValue;
@property (assign, readwrite) ValueType type;
@property (retain, readonly) NSMutableArray* listeners;
@property (retain, readwrite) Evaluator* evaluator;
@property (assign) BOOL removeFromListener;

-(void) initFields:(ValueType)_type;
-(BindableObject*) initWithValue: (id)_value;
-(BindableObject*) initWithNumber: (float)_value;
-(BindableObject*) initWithBool: (BOOL) _value;
-(void) notifyListeners;
-(void) addListener: (id)control;

@end

