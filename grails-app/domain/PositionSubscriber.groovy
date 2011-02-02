class PositionSubscriber {
    static hasMany = [devices:PositionDevice]
    String receiveOnUrl
    boolean receiveNow
}