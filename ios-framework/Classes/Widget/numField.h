//
//  iNumField.h
//  iPadFramework
//
//  Created by Nami on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "textBox.h"
#import "Num.h"


@interface numField : textBox {
	BindableObject* numberBindableObject;
}

@property (nonatomic, retain) Num* number;
@property (nonatomic, retain) BindableObject* numberBindableObject;

-(Num*) getNumberFromText;


@end
