//
//  TypedValue.h
//  ipad-framework-main
//
//  Created by Nami on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TypedValue : NSObject {
	NSString* type;
	id value;
}

@property (retain, readwrite, nonatomic) NSString* type;
@property (retain, readwrite, nonatomic) id value;

-(TypedValue*) initWithType: (NSString*)_type value:(id)_value;

@end
