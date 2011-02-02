class PositionDevice {
    static belongsTo = [owner:PositionSubscriber]
    String idExternal
    String description
    Double currentLongitude
    Double currentLatitude
    
    static constraints = {
        description(nullable:true)
    }
}