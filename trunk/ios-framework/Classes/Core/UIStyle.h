//
//  Style.h
//  iPadFramework
//
//  Created by Nami on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum 
{
	Left = 0,
	Right = 1,
	LeftRight = 2,
	None = 3
} Anchor;

typedef enum  
{
	CurrentLine = 0,
 	NextLine = 1
} Place;


@interface UIStyle : NSObject {
	int left;
	int top;
	int width;
	int height;
	int margin_left;
	int margin_right;
	int margin_top;
	int margin_bottom;
	NSString* place;
	NSString* anchor;
}

@property ( assign ) int left;
@property ( assign ) int top;
@property ( assign ) int width;
@property ( assign ) int height;
@property ( assign ) int margin_left;
@property ( assign ) int margin_right;
@property ( assign ) int margin_top;
@property ( assign ) int margin_bottom;
@property ( nonatomic, retain, readwrite ) NSString* place;
@property ( nonatomic, retain, readwrite ) NSString* anchor;

-(UIStyle*) initialize;

@end
