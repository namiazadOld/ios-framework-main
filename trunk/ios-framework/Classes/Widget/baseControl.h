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

@class navBar;

@interface baseControl : NSObject<Notifiable> {
	//CGRect lastInnerControlFrame;
	baseControl* lastInnerControl;
	BOOL locked;
	baseControl* parentWidget;
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
	
	baseControl* currentRole;
	baseControl* elementOf;
	baseControl* elements;
	
	BOOL visible;
	BOOL isRendered;
	BOOL removeFromListener;
	
	baseControl* parentCache;
	int index;
	BOOL isWhen;
	
}

//@property (assign) CGRect lastInnerControlFrame;
@property (readwrite, retain) baseControl* lastInnerControl;
@property (readwrite, assign) BOOL locked;
@property (readwrite, retain) baseControl* parentWidget;
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
@property (nonatomic, retain) baseControl* currentRole;
@property (nonatomic, retain) baseControl* elementOf;
@property (nonatomic, retain) baseControl* elements;
@property (assign) BOOL visible;
@property (nonatomic, retain) NSMutableArray* args;
@property (assign) BOOL isRendered;
@property (assign) BOOL removeFromListener;

//Two belowing control only works for When clause.
@property (retain, nonatomic) baseControl* parentCache;
@property (assign) int index;
@property (assign) BOOL isWhen;

-(baseControl*) initWithElementOf: (baseControl*)_elementOf;
-(baseControl*) render: (NSMutableArray*)arguments container: (baseControl*)parent elements: (baseControl*) elements;
-(void) renderElements: (baseControl*)parent;
-(void) setControlStyle:(UIStyle *)style;
-(CGRect) getRecommendedFrame: (baseControl*)parent;
-(CGRect) getFrame;
-(void) setFrame: (CGRect)frame;
-(UIView*) getView;
-(UIView*) getChildrenHolder;
-(void)orientationChanged:(UIInterfaceOrientation)toInterfaceOrientation ; 
-(void) addBodyControl:(baseControl*) widget;
-(void) finilize;
-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
-(void) changeNotification:(BindableObject*) bo;
-(void) parentChanged: (baseControl*)parent;
-(void) childUpdated: (baseControl*)child;
-(void) manageArguments: (NSMutableArray*)arguments container: (baseControl*)parent;
-(void)manageStyleArgument: (BindableObject*)bo;
-(void) manageArgument: (BindableObject*)bo at:(int)index;
-(void) eventOccured: (id) sender;
-(void) hide;
-(void) show;
-(baseControl*) getRootContainer;
-(NSMutableArray*) getFlattenChildren;
-(baseControl*) getContainer;
-(void) setHeader: (navBar*) hdr;
-(float) calculatedHeight;
-(id) getController;
+(void) ChangeControl:(baseControl*)source to:(baseControl*)target;


@end
