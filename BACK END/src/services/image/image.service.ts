import { Injectable } from "@nestjs/common";
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Image } from "src/entities/image.entity";


@Injectable()
export class ImageService extends TypeOrmCrudService<Image> {
    constructor( @InjectRepository(Image) private readonly image: Repository<Image>) {
        super(image);
    }
    
    add(newImage: Image): Promise<Image>{
        return this.image.save(newImage);
    }   
}

