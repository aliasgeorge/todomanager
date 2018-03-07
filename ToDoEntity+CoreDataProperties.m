//
//  ToDoEntity+CoreDataProperties.m
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import "ToDoEntity+CoreDataProperties.h"

@implementation ToDoEntity (CoreDataProperties)

+ (NSFetchRequest<ToDoEntity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ToDoEntity"];
}

@dynamic toDoTitle;
@dynamic toDoStatus;
@dynamic toDoCatagory;
@dynamic toDoStartDate;
@dynamic toDoFinishDate;
@dynamic toDoPriority;
@dynamic toDoDueDate;

@end
