//
//  NSStack.h
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSStack : NSObject {
	@private NSMutableArray* storage;
}

@property (nonatomic, retain, readwrite) NSMutableArray* storage;

-(NSStack*) init;
-(void) push: (id)value;
-(id)   pop;
-(id)   top; 

@end
