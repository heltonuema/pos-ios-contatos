//
//  Contato+CoreDataProperties.h
//  Contato
//
//  Created by Helton Shinhei Uema on 22/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import "Contato.h"


NS_ASSUME_NONNULL_BEGIN

@interface Contato (CoreDataProperties)

+ (NSFetchRequest<Contato *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSString *sobrenome;
@property (nullable, nonatomic, copy) NSString *endereco;

@end

NS_ASSUME_NONNULL_END
