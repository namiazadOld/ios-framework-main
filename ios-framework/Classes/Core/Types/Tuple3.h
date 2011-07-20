//
//  Tuple3.h
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tuple2.h"


@interface Tuple3 : Tuple2 {
	BindableObject* _3;
}

@property (readwrite, assign) BindableObject* _3;

@end
