import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Auction } from "./auction.entity";
import { Image } from "./image.entity";
import { Category } from "./category.entity";
import { ProductPrice } from "./productPrice.entity";
import { User } from "./user.entity";

@Index("fk_product_category_id", ["categoryId"], {})
@Index("fk_product_user_id", ["userId"], {})
@Entity("product")
export class Product {
  @PrimaryGeneratedColumn({ type: "int", name: "product_id", unsigned: true })
  productId: number;

  @Column("varchar", {
    name: "product_name",
    length: 128,
    default: () => "'0'",
  })
  productName: string;

  @Column("text")
  description: string;

  @Column("int", { name: "category_id", unsigned: true })
  categoryId: number;

  @Column("int", { name: "user_id", unsigned: true })
  userId: number;

  @Column("timestamp", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @OneToMany(() => Auction, (auction) => auction.product)
  auctions: Auction[];

  @OneToMany(() => Image, (image) => image.product)
  images: Image[];

  @ManyToOne(() => Category, (category) => category.products, {
    onDelete: "RESTRICT",
    onUpdate: "CASCADE",
  })
  @JoinColumn([{ name: "category_id", referencedColumnName: "categoryId" }])
  category: Category;

  @OneToMany(() => ProductPrice, (productPrice) => productPrice.product)
  productPrices: ProductPrice[];

  @ManyToOne(() => User, (user) => user.products, {
    onDelete: "RESTRICT",
    onUpdate: "CASCADE",
  })
  @JoinColumn([{ name: "user_id", referencedColumnName: "userId" }])
  user: User;
}
