import ballerina/http;
import ballerina/io;

public function regCheck() {
    io:println("Checking regon");

    http:Client clientEP = new ("http://172.30.128.32:8080");

    var regon = "370026553";

    var resp = clientEP->get("/regonservice/regon/"+regon);

    if (resp is http:Response) {
        var payload = resp.getTextPayload();
        if (payload is string) {

            io:println(payload);
        } else {

            io:println(payload.detail());
        }
    } else {

        io:println(resp.detail());
    }



}
