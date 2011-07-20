//
//  Context.h
//  iPadFramework
//
//  Created by Nami on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iView.h"

@interface Context : NSObject {
	
}

+(iView*) rootView;
+(void) setRootView:(iView *)view;
+(void) addView: (iView*)view withName: (NSString*)name;
+(iView*) getView: (NSString*)name;
+(void) bringToFront: (iView*)view;

@end
