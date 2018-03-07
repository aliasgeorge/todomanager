//
//  ToDoEntity+CoreDataProperties.h
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import "ToDoEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

+ (NSFetchRequest<ToDoEntity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *toDoTitle;
@property (nullable, nonatomic, copy) NSString *toDoStatus;
@property (nullable, nonatomic, copy) NSString *toDoCatagory;
@property (nullable, nonatomic, copy) NSDate *toDoStartDate;
@property (nullable, nonatomic, copy) NSDate *toDoFinishDate;
@property (nonatomic) int32_t toDoPriority;
@property (nullable, nonatomic, copy) NSDate *toDoDueDate;

@end

NS_ASSUME_NONNULL_END
