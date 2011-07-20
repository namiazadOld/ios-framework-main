//
//  Tuple2.h
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tuple1.h"


@interface Tuple2 : Tuple1 {
	BindableObject* _2;
}

@property (readwrite, assign) BindableObject* _2;

@end
