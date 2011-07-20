//
//  Evaluator.h
//  ipad-framework-main
//
//  Created by Nami on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scope.h"


@interface Evaluator : NSObject {
	Scope* scope;
}

@property (retain, readwrite) Scope* scope;

-(Evaluator*) initWithScope: (Scope*)_scope;
-(float) evaluateNum;
-(BOOL) evaluateBool;
-(id) evaluate;

@end
