//
//  CallBack.h
//  iPadFramework
//
//  Created by Nami on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scope.h"


@interface Callback : NSObject {
	Scope* scope;
}

@property (nonatomic, retain) Scope* scope;
-(Callback*) initWithScope: (Scope*)_scope;
-(void) action: (id)sender;

@end
