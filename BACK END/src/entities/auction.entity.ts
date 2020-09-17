import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Product } from "./product.entity";
import { User } from "./user.entity";

@Index("fk_auction_product_id", ["productId"], {})
@Index("fk_auction_user_id", ["userId"], {})
@Entity("auction")
export class Auction {
  @PrimaryGeneratedColumn({ type: "int", name: "auction_id", unsigned: true })
  auctionId: number;

  @Column("varchar", {
    name: "auction_name",
    length: 128,
    default: () => "'0'",
  })
  auctionName: string;

  @Column("int", { name: "user_id", nullable: true, unsigned: true, default: () => "'0'" })
  userId: number | null;

  @Column("int", { name: "product_id", unsigned: true, default: () => "'0'" })
  productId: number;

  @Column("enum", {
    name: "status",
    enum: ["active", "expired"],
    default: () => "'active'",
  })
  status: "active" | "expired";

  @Column("timestamp", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @Column("datetime")
  duration: Date;

  @ManyToOne(() => Product, (product) => product.auctions, {
    onDelete: "RESTRICT",
    onUpdate: "CASCADE",
  })
  @JoinColumn([{ name: "product_id", referencedColumnName: "productId" }])
  product: Product;

  @ManyToOne(() => User, (user) => user.auctions, {
    onDelete: "RESTRICT",
    onUpdate: "CASCADE",
  })
  @JoinColumn([{ name: "user_id", referencedColumnName: "userId" }])
  user: User;
}
