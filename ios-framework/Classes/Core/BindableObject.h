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
#import "NSObject+mobl.h"




@interface BindableObject : NSObject<Notifiable> {
	NSObject* _bv;
	NSMutableArray* listeners;
	Evaluator* evaluator;
	BOOL removeFromListener;
}

@property (copy) NSObject* value;
@property (retain, readonly) NSMutableArray* listeners;
@property (retain, readwrite) Evaluator* evaluator;
@property (assign) BOOL removeFromListener;

-(void) initFields;
-(BindableObject*) initializeWithValue: (id) _value;
-(void) notifyListeners;
-(void) addListener: (id)control;


@end

