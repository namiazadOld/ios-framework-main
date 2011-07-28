//
//  Bool.h
//  ipad-framework-main
//
//  Created by Nami on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+mobl.h"


@interface Bool : NSObject {
	BOOL value;
}

@property (assign) BOOL value;

-(Bool*) initWithBool: (BOOL)_value;

-(Bool*) Not;
-(BOOL) isTrue;
@end
