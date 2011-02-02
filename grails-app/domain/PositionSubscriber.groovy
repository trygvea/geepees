class PositionSubscriber {
    static hasMany = [devices:PositionDevice]
    String receiveOnUrl
    boolean receiveNow
    String name

    static constraints = {
        name(nullable:true)
    }
}