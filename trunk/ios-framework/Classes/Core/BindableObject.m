//
//  BindableObject.m
//  iPadFramework
//
//  Created by Nami on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BindableObject.h"
#import "iBaseControl.h"


@implementation BindableObject
@synthesize value, listeners, evaluator, removeFromListener;

-(void) initFields
{
	if (listeners == nil)
		listeners = [[NSMutableArray alloc] init];
}


-(BindableObject*) initializeWithValue: (id) _value
{
	[self initFields];
	self.value = _value;
	return self;
}

-(void) addListener: (id) listener
{
	[self.listeners addObject:listener];
}

-(void) notifyListeners
{
	int i = 0;
	while (i < [self.listeners count])
	{
		if ([[self.listeners objectAtIndex:i] removeFromListener])
			[self.listeners removeObjectAtIndex:i];
		else
			i++;
	}
	
	for (id<Notifiable> control in self.listeners)
		[control changeNotification:self];
}

-(void) setValue:(id)_value
{
	@synchronized(self)
	{
		[self initFields];
		if (value != NULL && _value != NULL && [_value isKindOfClass:[iBaseControl class]])
			[iBaseControl ChangeControl:(iBaseControl*)value to:(iBaseControl*)_value];
		value = _value;
		[self notifyListeners];
	}
}

-(void) changeNotification:(BindableObject*) sender
{
	if (self.evaluator == NULL)
		return;
	[self setValue:[self.evaluator evaluate]];
}

@end
