//
//  Contato.m
//  Contato
//
//  Created by Helton Shinhei Uema on 01/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import "Contato.h"

@implementation Contato

-(NSString *) nomeCompleto {
    return [NSString stringWithFormat:@"%@ %@", self.nome, self.sobrenome];
}

// Insert code here to add functionality to your managed object subclass

@end
