//
//  Tuple4.h
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tuple3.h"


@interface Tuple4 : Tuple3 {
	BindableObject* _4;
}

@property (readwrite, assign) BindableObject* _4;

@end
