//
//  NSSelector.h
//  iPadFramework
//
//  Created by Nami on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSSelector : NSObject {
	SEL method;
	id target;
}

@property (readwrite, assign) SEL method;
@property (readwrite, retain) id target;

-(NSSelector*) initWithSelector: (SEL) selector target:(id)_target;

@end
