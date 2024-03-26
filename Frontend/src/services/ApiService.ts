import {Appsettings} from "../../Appsettings";

export interface IApiService {
    getRequest : (endpoint:string) => Promise<object>;
}

class MockApiService implements IApiService{
    async getRequest (endpoint: string) {
        let response;
        switch(endpoint) {
            case "GetUsers":
                response = [{
                    "firstName" : "Matthew",
                    "lastName" : "Walloch",
                    "location" : "South Milwaukee",
                    "group" : 2,
                    "title" : "Software Engineer",
            }];
            break;

            case "GetGroups":
                response = [{
                    "name" : "Web Application Team",
                    "department" : "Software Development",
                    "status" : "Active",
                    "obj" : "Create and maintain buisness site",
                }, 
                {
                    "name" : "Security Education",
                    "department" : "Security",
                    "status" : "Active",
                    "obj" : "Train security personel",
                    },
                {
                    "name" : "MKE Maintenence",
                    "department" : "Maintenence",
                    "status" : "Active",
                    "obj" : "Maintain facility functionality and hygiene",
                }];
                break;
            }
            
        return(await Promise.resolve(response))
    }
}

class RealApiService implements IApiService{
    private baseUrl : string =  `${window.location.origin}/api`;
    

    async getRequest (endpoint: string) {
        let response = await fetch(`${this.baseUrl}/${endpoint}`)
        return(JSON.parse(`{"data": ${await response.text()} }`).data)
    }
}

export const ApiService : IApiService = Appsettings.Built ? new RealApiService() : new MockApiService()