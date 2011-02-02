class PositionDevice {
    static belongsTo = [owner:PositionSubscriber]
    String idExternal
    String description
    
    static constraints = {
        description(nullable:true)
    }
}