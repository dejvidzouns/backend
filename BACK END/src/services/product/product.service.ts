import { Injectable } from "@nestjs/common";
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Product } from "src/entities/product.entity";
import { AddProductDto } from "src/dtos/product/add.product.dto";
import { ApiResponse } from "src/misc/api.response.class";
import { Image } from "src/entities/image.entity";
// import { ProductPrice } from "entities/productPrice.entity";


@Injectable()
export class ProductService extends TypeOrmCrudService<Product> {
    constructor( 
        @InjectRepository(Product) 
        private readonly product: Repository<Product>,

        @InjectRepository(Image)
        private readonly image: Repository<Image>,

        // @InjectRepository(ProductPrice)        //proveriti posto se cena vezuje za aukciju, ne za proizvod
        // private readonly productPrice: Repository<ProductPrice>
    ) {
        super(product);
    }
    
    async createFullProduct(data: AddProductDto): Promise<Product | ApiResponse>{
        const newProduct: Product = new Product();
        newProduct.productName = data.productName;
        newProduct.categoryId = data.categoryId;
        newProduct.description = data.description;
        newProduct.userId = 1; //naknadno podesiti da ovo bude user koji postavlja proizvod

        const savedProduct = await this.product.save(newProduct);

        const newImage = new Image();   //jos proveriti, tabela, objekat ili sta vec
        newImage.productId = savedProduct.productId;
        //newImage.imagePath = data.images;

        return await this.product.findOne(savedProduct.productId, {
            relations: [
                "category",
                "images"
            ]
        });
    }
}

