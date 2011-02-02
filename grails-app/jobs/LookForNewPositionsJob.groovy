class LookForNewPositionsJob {
    def timeout = 5000l // execute job once in 5 seconds
    Random random
    static double MOVING_INCREMENT = 0.00001 

    def execute() {
        random = new Random();
        def subscribers = PositionSubscriber.findAllReceiveNow()
        subscribers.each {subscriber ->
            def movingDevices = []
            subscriber.devices.each { device ->
                if (random.nextInt(10) == 0) {
                    movingDevices += device
                }
            }
            movingDevices.each {
                moveRandomly(it)
            }
            sendMessage(movingDevices)
        }
    }
    
    private def moveRandomly(device) {
        switch (random.nextInt(4)) {
            case 0: device.currentLongitude += MOVING_INCREMENT; break
            case 1: device.currentLongitude -= MOVING_INCREMENT; break
            case 2: device.currentLatitude += MOVING_INCREMENT; break
            case 3: device.currentLatitude -= MOVING_INCREMENT; break
        }
        new ReportLog(
            whenReported: new Date(), 
            what: "Device "+device.idExternal +" moved to (lat,long)="+device.currentLatitude+","+device.currentLongitude, 
        ).save(flush:true, failOnError:true)
    }
    
    private def sendMessage(devices) {
/*        HttpClient httpClient = new HttpClient()
        GetMethod method = new GetMethod(realUrl.toString());
        try {
            int statusCode = httpClient.executeMethod(method);
            if (statusCode != HttpStatus.SC_OK) {
                throw new RuntimeException("HttpClient returned statusCode="+statusCode)
            }
            byte[] responseBody = method.getResponseBody();
            response.contentType = "image/png"
            response.outputStream << responseBody
        } catch (Exception ex) {
            println "####################"
            println "Response:" + method.responseBody
            ex.printStackTrace()
            throw ex
        } 
*/		
    }
}
