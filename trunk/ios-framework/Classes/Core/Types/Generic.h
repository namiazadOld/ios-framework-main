//
//  Generic.h
//  ios-framework
//
//  Created by Nami on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+mobl.h"


@interface Generic : NSObject {
	NSString* typeName;
}

-(Generic*) initWithTypeName: (NSString*) _typeName;

@property (nonatomic, retain) NSString* typeName;

@end
