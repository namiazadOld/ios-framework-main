//
//  String.h
//  ipad-framework-main
//
//  Created by Nami on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "Object.h"


@interface String : Object {
	NSString* value;
}

@property (retain, nonatomic) NSString* value;

-(String*) initWithString: (NSString*)input;

@end
