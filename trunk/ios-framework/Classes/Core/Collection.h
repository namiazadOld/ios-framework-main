//
//  Collection.h
//  ipad-framework-main
//
//  Created by Nami on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>



@interface Collection : NSObject {
	NSMutableArray* data;
}

-(void) add: (id)item;

@end
