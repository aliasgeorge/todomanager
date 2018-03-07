//
//  AGHandlesMOC.h
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AGHandlesMOC <NSObject>

-(void)receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
