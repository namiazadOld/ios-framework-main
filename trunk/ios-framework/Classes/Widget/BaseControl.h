//
//  iBaseControl.h
//  iPadFramework
//
//  Created by Nami on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BindableObject.h"
#import "Scope.h"
#import "UIStyle.h"

@class iHeader;

@interface BaseControl : NSObject<Notifiable> {
	//CGRect lastInnerControlFrame;
	BaseControl* lastInnerControl;
	BOOL locked;
	BaseControl* parentWidget;
	UIViewController* viewController;
	NSMutableArray* children;
	NSMutableArray* args;
	Scope* scope;
	
	float marginLeft;
	float marginRight;
	float marginTop;
	float marginBottom;
	int lineNo;
	
	Anchor anchor;
	Place  place;
	CGRect initialFrame;
	
	BaseControl* currentRole;
	BaseControl* elementOf;
	BaseControl* elements;
	
	BOOL visible;
	BOOL isRendered;
	BOOL removeFromListener;
	
	BaseControl* parentCache;
	int index;
	BOOL isWhen;
	
}

//@property (assign) CGRect lastInnerControlFrame;
@property (readwrite, retain) BaseControl* lastInnerControl;
@property (readwrite, assign) BOOL locked;
@property (readwrite, retain) BaseControl* parentWidget;
@property (nonatomic, retain) UIViewController* viewController;
@property (nonatomic) Anchor anchor;
@property (nonatomic) Place place;
@property (assign) CGRect initialFrame;
@property (readonly, retain) NSMutableArray* children;
@property (nonatomic, retain) Scope* scope;
@property (assign) float marginLeft;
@property (assign) float marginRight;
@property (assign) float marginTop;
@property (assign) float marginBottom;
@property (assign) int lineNo;
@property (nonatomic, retain) BaseControl* currentRole;
@property (nonatomic, retain) BaseControl* elementOf;
@property (nonatomic, retain) BaseControl* elements;
@property (assign) BOOL visible;
@property (nonatomic, retain) NSMutableArray* args;
@property (assign) BOOL isRendered;
@property (assign) BOOL removeFromListener;

//Two belowing control only works for When clause.
@property (retain, nonatomic) BaseControl* parentCache;
@property (assign) int index;
@property (assign) BOOL isWhen;

-(BaseControl*) initWithElementOf: (BaseControl*)_elementOf;
-(BaseControl*) render: (NSMutableArray*)arguments container: (BaseControl*)parent elements: (BaseControl*) elements;
-(void) renderElements: (BaseControl*)parent;
-(void) setControlStyle:(UIStyle *)style;
-(CGRect) getRecommendedFrame: (BaseControl*)parent;
-(CGRect) getFrame;
-(void) setFrame: (CGRect)frame;
-(UIView*) getView;
-(UIView*) getChildrenHolder;
-(void)orientationChanged:(UIInterfaceOrientation)toInterfaceOrientation ; 
-(void) addBodyControl:(BaseControl*) widget;
-(void) finilize;
-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
-(void) changeNotification:(BindableObject*) bo;
-(void) parentChanged: (BaseControl*)parent;
-(void) childUpdated: (BaseControl*)child;
-(void) manageArguments: (NSMutableArray*)arguments container: (BaseControl*)parent;
-(void)manageStyleArgument: (BindableObject*)bo;
-(void) manageArgument: (BindableObject*)bo at:(int)index;
-(void) eventOccured: (id) sender;
-(void) hide;
-(void) show;
-(BaseControl*) getRootContainer;
-(NSMutableArray*) getFlattenChildren;
-(BaseControl*) getContainer;
-(void) setHeader: (iHeader*) header;
-(float) calculatedHeight;
-(id) getController;
+(void) ChangeControl:(BaseControl*)source to:(BaseControl*)target;


@end
