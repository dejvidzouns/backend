import { Injectable } from "@nestjs/common";
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { ProductPrice } from "src/entities/productPrice.entity";


@Injectable()
export class ProductPriceService extends TypeOrmCrudService<ProductPrice> {
    constructor( @InjectRepository(ProductPrice) private readonly productPrice: Repository<ProductPrice>) {
        super(productPrice);
    }   
}

