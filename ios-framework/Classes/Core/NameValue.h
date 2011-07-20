//
//  NameValue.h
//  ipad-framework-main
//
//  Created by Nami on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NameValue : NSObject {
	NSString* name;
	id value;
}

@property (retain, readwrite) NSString* name;
@property (retain, readwrite) id value;

-(NameValue*) initWithName: (NSString*)_name value:(id)_value;

@end
