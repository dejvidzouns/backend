import { Controller } from "@nestjs/common";
import { Crud } from "@nestjsx/crud";
import { ProductPrice } from "src/entities/productPrice.entity";
import { ProductPriceService } from "src/services/productPrice/productPrice.service";

@Controller('api/productprice')
@Crud({
    model: {
        type: ProductPrice
    },
    params: {
        id: {
            field: 'productPrice_id',
            type: 'number',
            primary: true
        }
    },
    query: {
        join: {
            product: {
                eager: true
            }
        }
    }
})
export class ProductPriceControler {
    constructor(public service: ProductPriceService) {}
}