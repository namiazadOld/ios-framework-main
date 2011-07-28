//
//  Function1.h
//  ios-framework
//
//  Created by Nami on 7/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+mobl.h"

@interface Function1 : NSObject {
	NSString* className;
	SEL method;
}

@property (nonatomic, retain) NSString* className;
@property (assign) SEL method;

-(Function1*) initWithInstance: (NSString*)_className method: (SEL) _method;
-(NSObject*) invoke: (id)param ;

@end
