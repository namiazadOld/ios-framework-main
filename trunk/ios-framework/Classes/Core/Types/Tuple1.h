//
//  Tuple1.h
//  ipad-framework-main
//
//  Created by Nami on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BindableObject.h"
#import "NSObject+mobl.h"


@interface Tuple1 : NSObject {
	BindableObject* _1;
}

@property (readwrite, assign) BindableObject* _1;

-(Tuple1*) initialize:(NSArray*)values;

@end
