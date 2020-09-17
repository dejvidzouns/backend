export class LoginInfoAdministratorDto {
    administratorId: number;
    username: string;
    token: string;

    constructor(id: number, un: string, jwt: string){
        this.username = un;
        this.administratorId = id;
        this.token = jwt;
    }
}