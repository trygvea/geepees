package geepees


class LookForNewPositionsJob {
    def timeout = 5000l // execute job once in 5 seconds
    Random random
    static double MOVING_INCREMENT = 0.00001 

    def execute() {
        random = new Random();
        PositionSubscriber.findAllReceiveNow().each {subscriber ->
            def movingDevices = []
            subscriber.devices.each { device ->
                if (random.nextInt(10) == 0) {
                    movingDevices += device
                }
            }
            movingDevices.each {
                moveRandomly(movingDevice)
            }
        }
    }
    
    private def moveRandomly(device) {
        switch (random.nextInt(4)) {
            case 0: movingDevices.currentLongitude += MOVING_INCREMENT; break
            case 1: movingDevices.currentLongitude -= MOVING_INCREMENT; break
            case 2: movingDevices.currentLatitude += MOVING_INCREMENT; break
            case 3: movingDevices.currentLatitude -= MOVING_INCREMENT; break
        }
        new ReportLog(
            when: new Date(), 
            what: "Device "+movingDevices.idExternal +" moved to (lat,long)="+movingDevices.currentLatitude+","+movingDevices.currentLongitude, 
            subscriber: subscriber
        ).save(flush:true, failOnError:true)
    }
}
