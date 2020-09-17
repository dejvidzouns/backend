import { Injectable } from "@nestjs/common";
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Auction } from "src/entities/auction.entity";


@Injectable()
export class AuctionService extends TypeOrmCrudService<Auction> {
    constructor( @InjectRepository(Auction) private readonly auction: Repository<Auction>) {
        super(auction);
    }   
}

