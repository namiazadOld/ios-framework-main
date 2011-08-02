//
//  iWhen.h
//  ipad-framework-main
//
//  Created by Nami on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "BindableObject.h"
#import "customControl.h"
#import "Bool.h"


@interface when : customControl {
	customControl* whn;
	customControl* elsewhn;
	BindableObject* conditionBindableObject;
}

@property (nonatomic, retain) customControl* whn;
@property (nonatomic, retain) customControl* elsewhn;
@property (nonatomic, retain) Bool* condition;
@property (nonatomic, retain) BindableObject* conditionBindableObject;

@end
