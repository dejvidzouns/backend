import { Column, Entity, Index, PrimaryGeneratedColumn } from "typeorm";

@Index("uq_administrator_username", ["username"], { unique: true })
@Entity("administrator")
export class Administrator {
  @PrimaryGeneratedColumn({ type: "int", name: "administrator_id" })
  administratorId: number;

  @Column("varchar", { unique: true, length: 50 })
  username: string;

  @Column("varchar", { name: "password_hash", length: 128 })
  passwordHash: string;

  @Column("timestamp", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;
}
