//
//  Array.h
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Object.h"
#import "BindableObject.h"


@interface Array : Object{
	NSMutableArray* data;
	BindableObject* _length;
}


@property (nonatomic, retain) BindableObject* length;

-(id) get

@end
