export class JwtDataAdministratorDto{
    administratorId: number;
    username: string;
    exp: number; //unix timestamp
    ip: string;
    ua: string; //user agent

    // eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
    toPlainObject(){
        return {
            administratorId: this.administratorId,
            username: this.username,
            exp: this.exp,
            ip: this.ip,
            ua: this.ua
        };
    }
}