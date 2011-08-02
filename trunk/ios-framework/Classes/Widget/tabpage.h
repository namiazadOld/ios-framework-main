//
//  iTabPage.h
//  ipad-framework-main
//
//  Created by Nami on 5/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "BindableObject.h"


@interface tabpage : baseControl{
	UIViewController* tabPage;
	BindableObject* titleBindableObject;
}

@property (retain, nonatomic) UIViewController* tabPage;
@property (retain, nonatomic) BindableObject* titleBindableObject;
@property (retain, nonatomic) NSString* title;

@end
