class PositionSubscriberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [positionSubscriberInstanceList: PositionSubscriber.list(params), positionSubscriberInstanceTotal: PositionSubscriber.count()]
    }

    def create = {
        def positionSubscriberInstance = new PositionSubscriber()
        positionSubscriberInstance.properties = params
        return [positionSubscriberInstance: positionSubscriberInstance]
    }

    def save = {
        def positionSubscriberInstance = new PositionSubscriber(params)
        if (positionSubscriberInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'positionSubscriber.label', default: 'PositionSubscriber'), positionSubscriberInstance.id])}"
            redirect(action: "show", id: positionSubscriberInstance.id)
        }
        else {
            render(view: "create", model: [positionSubscriberInstance: positionSubscriberInstance])
        }
    }

    def show = {
        def positionSubscriberInstance = PositionSubscriber.get(params.id)
        if (!positionSubscriberInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'positionSubscriber.label', default: 'PositionSubscriber'), params.id])}"
            redirect(action: "list")
        }
        else {
            [positionSubscriberInstance: positionSubscriberInstance]
        }
    }

    def edit = {
        def positionSubscriberInstance = PositionSubscriber.get(params.id)
        if (!positionSubscriberInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'positionSubscriber.label', default: 'PositionSubscriber'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [positionSubscriberInstance: positionSubscriberInstance]
        }
    }

    def update = {
        def positionSubscriberInstance = PositionSubscriber.get(params.id)
        if (positionSubscriberInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (positionSubscriberInstance.version > version) {
                    
                    positionSubscriberInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'positionSubscriber.label', default: 'PositionSubscriber')] as Object[], "Another user has updated this PositionSubscriber while you were editing")
                    render(view: "edit", model: [positionSubscriberInstance: positionSubscriberInstance])
                    return
                }
            }
            positionSubscriberInstance.properties = params
            if (!positionSubscriberInstance.hasErrors() && positionSubscriberInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'positionSubscriber.label', default: 'PositionSubscriber'), positionSubscriberInstance.id])}"
                redirect(action: "show", id: positionSubscriberInstance.id)
            }
            else {
                render(view: "edit", model: [positionSubscriberInstance: positionSubscriberInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'positionSubscriber.label', default: 'PositionSubscriber'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def positionSubscriberInstance = PositionSubscriber.get(params.id)
        if (positionSubscriberInstance) {
            try {
                positionSubscriberInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'positionSubscriber.label', default: 'PositionSubscriber'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'positionSubscriber.label', default: 'PositionSubscriber'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'positionSubscriber.label', default: 'PositionSubscriber'), params.id])}"
            redirect(action: "list")
        }
    }
}
