//
//  Notifiable.h
//  ipad-framework-main
//
//  Created by Nami on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BindableObject;

@protocol Notifiable
-(void) changeNotification:(BindableObject*) sender;
@end

