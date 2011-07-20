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

@interface iBaseControl : NSObject<Notifiable> {
	//CGRect lastInnerControlFrame;
	iBaseControl* lastInnerControl;
	BOOL locked;
	iBaseControl* parentWidget;
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
	
	iBaseControl* currentRole;
	iBaseControl* elementOf;
	iBaseControl* elements;
	
	BOOL visible;
	BOOL isRendered;
	BOOL removeFromListener;
	
}

//@property (assign) CGRect lastInnerControlFrame;
@property (readwrite, retain) iBaseControl* lastInnerControl;
@property (readwrite, assign) BOOL locked;
@property (readwrite, retain) iBaseControl* parentWidget;
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
@property (nonatomic, retain) iBaseControl* currentRole;
@property (nonatomic, retain) iBaseControl* elementOf;
@property (nonatomic, retain) iBaseControl* elements;
@property (assign) BOOL visible;
@property (nonatomic, retain) NSMutableArray* args;
@property (assign) BOOL isRendered;
@property (assign) BOOL removeFromListener;

-(iBaseControl*) initWithElementOf: (iBaseControl*)_elementOf;
-(iBaseControl*) render: (NSMutableArray*)arguments container: (iBaseControl*)parent elements: (iBaseControl*) elements;
-(void) renderElements: (iBaseControl*)parent;
-(void) setControlStyle:(UIStyle *)style;
-(CGRect) getRecommendedFrame: (iBaseControl*)parent;
-(CGRect) getFrame;
-(void) setFrame: (CGRect)frame;
-(UIView*) getView;
-(UIView*) getChildrenHolder;
-(void)orientationChanged:(UIInterfaceOrientation)toInterfaceOrientation ; 
-(void) addBodyControl:(iBaseControl*) widget;
-(void) finilize;
-(void) addTarget:(id)target  action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
-(void) changeNotification:(BindableObject*) bo;
-(void) parentChanged: (iBaseControl*)parent;
-(void) childUpdated: (iBaseControl*)child;
-(void) manageArguments: (NSMutableArray*)arguments container: (iBaseControl*)parent;
-(void)manageStyleArgument: (BindableObject*)bo;
-(void) manageArgument: (BindableObject*)bo at:(int)index;
-(void) eventOccured: (id) sender;
-(void) hide;
-(void) show;
-(iBaseControl*) getRootContainer;
-(NSMutableArray*) getFlattenChildren;
-(iBaseControl*) getContainer;
-(void) setHeader: (iHeader*) header;
+(void) ChangeControl:(iBaseControl*)source to:(iBaseControl*)target;


@end
