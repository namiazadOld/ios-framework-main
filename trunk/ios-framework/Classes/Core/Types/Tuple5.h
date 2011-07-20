//
//  Tuple5.h
//  ipad-framework-main
//
//  Created by Nami on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tuple4.h"


@interface Tuple5 : Tuple4 {
	BindableObject* _5;
}

@property (readwrite, assign) BindableObject* _5;

@end

