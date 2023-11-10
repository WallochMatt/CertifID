let appsettings: any = {
    "built": false
}

class Configurations {
    Built: boolean = appsettings["built"];

    constructor() {
        for (let [k, v] of Object.entries(appsettings)) {
            let propName = k.charAt(0).toUpperCase() + k.substring(1);
            this[propName] = v;
        }
    }
}

export const Appsettings = new Configurations();
