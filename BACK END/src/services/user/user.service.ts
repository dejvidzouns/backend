import { Injectable } from "@nestjs/common";
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { User } from "src/entities/user.entity";


@Injectable()
export class UserService extends TypeOrmCrudService<User> {
    constructor( @InjectRepository(User) private readonly user: Repository<User>) {
        super(user);
    }   
}

