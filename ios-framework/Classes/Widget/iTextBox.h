//
//  iTextField.h
//  iPadFramework
//
//  Created by Nami on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"

@interface iTextBox : iBaseControl {
	UITextField* textBox;
	
	BindableObject* textBindableObject;
	BindableObject* placeholderBindableObject;
}

@property (nonatomic, retain) UITextField* textBox;
@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) NSString* placeholder;
@property (nonatomic, retain) BindableObject* textBindableObject;
@property (nonatomic, retain) BindableObject* placeholderBindableObject;

@end
