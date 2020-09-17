import { Controller } from "@nestjs/common";
import { Crud } from "@nestjsx/crud";
import { Auction } from "src/entities/auction.entity";
import { AuctionService } from "src/services/auction/auction.service";

@Controller('api/auction')
@Crud({
    model: {
        type: Auction
    },
    params: {
        id: {
            field: 'auctionId',
            type: 'number',
            primary: true
        }
    },
    query: {
        join: {
            product: {
                eager: true
            },
            user: {
                eager: true
            }
        }
    }
})
export class AuctionControler {
    constructor(public service: AuctionService) {}
}