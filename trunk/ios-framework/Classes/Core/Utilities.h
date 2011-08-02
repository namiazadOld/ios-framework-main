//
//  Utilities.h
//  iPadFramework
//
//  Created by Nami on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BindableObject.h"
#import "baseControl.h"


@interface Utilities : NSObject {

}

+(void) ShowError: (id)sender title: (NSString*)title content: (NSString*)content;
+(void) AddControl:(baseControl*) widget ToContainer: (baseControl*) container;
//+(BindableObject*) InitWithType: (TypedValue*) tv;
+(id) Tuple: (NSArray*)values;
+(NSString*) StringWithUUID;
+(UIViewController*) CurrentView;
+(NSManagedObjectModel*) ManagedObjectModel;
+(NSManagedObjectContext*) ManagedObjectContext;
+(void) setCurrentView: (UIViewController*)viewController;
+(void) setManagedObjectContext: (NSManagedObjectContext*)_managedObjectContext;
+(void) setManagedObjectModel: (NSManagedObjectModel*)_managedObjectModel;

@end
