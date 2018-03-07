//
//  AGHandlesToDoEntity.h
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoEntity+CoreDataClass.h"
@protocol AGHandlesToDoEntity <NSObject>

-(void)receiveToDoEntity:(ToDoEntity *)incomingToDoEntity;

@end
