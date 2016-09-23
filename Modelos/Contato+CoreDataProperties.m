//
//  Contato+CoreDataProperties.m
//  Contato
//
//  Created by Helton Shinhei Uema on 22/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import "Contato+CoreDataProperties.h"

@implementation Contato (CoreDataProperties)

+ (NSFetchRequest<Contato *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Contato"];
}

@dynamic nome;
@dynamic sobrenome;
@dynamic endereco;

@end
