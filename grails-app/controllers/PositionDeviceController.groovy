class PositionDeviceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [positionDeviceInstanceList: PositionDevice.list(params), positionDeviceInstanceTotal: PositionDevice.count()]
    }

    def create = {
        def positionDeviceInstance = new PositionDevice()
        positionDeviceInstance.properties = params
        return [positionDeviceInstance: positionDeviceInstance]
    }

    def save = {
        def positionDeviceInstance = new PositionDevice(params)
        if (positionDeviceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'positionDevice.label', default: 'PositionDevice'), positionDeviceInstance.id])}"
            redirect(action: "show", id: positionDeviceInstance.id)
        }
        else {
            render(view: "create", model: [positionDeviceInstance: positionDeviceInstance])
        }
    }

    def show = {
        def positionDeviceInstance = PositionDevice.get(params.id)
        if (!positionDeviceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'positionDevice.label', default: 'PositionDevice'), params.id])}"
            redirect(action: "list")
        }
        else {
            [positionDeviceInstance: positionDeviceInstance]
        }
    }

    def edit = {
        def positionDeviceInstance = PositionDevice.get(params.id)
        if (!positionDeviceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'positionDevice.label', default: 'PositionDevice'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [positionDeviceInstance: positionDeviceInstance]
        }
    }

    def update = {
        def positionDeviceInstance = PositionDevice.get(params.id)
        if (positionDeviceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (positionDeviceInstance.version > version) {
                    
                    positionDeviceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'positionDevice.label', default: 'PositionDevice')] as Object[], "Another user has updated this PositionDevice while you were editing")
                    render(view: "edit", model: [positionDeviceInstance: positionDeviceInstance])
                    return
                }
            }
            positionDeviceInstance.properties = params
            if (!positionDeviceInstance.hasErrors() && positionDeviceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'positionDevice.label', default: 'PositionDevice'), positionDeviceInstance.id])}"
                redirect(action: "show", id: positionDeviceInstance.id)
            }
            else {
                render(view: "edit", model: [positionDeviceInstance: positionDeviceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'positionDevice.label', default: 'PositionDevice'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def positionDeviceInstance = PositionDevice.get(params.id)
        if (positionDeviceInstance) {
            try {
                positionDeviceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'positionDevice.label', default: 'PositionDevice'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'positionDevice.label', default: 'PositionDevice'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'positionDevice.label', default: 'PositionDevice'), params.id])}"
            redirect(action: "list")
        }
    }
}
