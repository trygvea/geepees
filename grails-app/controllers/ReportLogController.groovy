class ReportLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reportLogInstanceList: ReportLog.list(params), reportLogInstanceTotal: ReportLog.count()]
    }

    def create = {
        def reportLogInstance = new ReportLog()
        reportLogInstance.properties = params
        return [reportLogInstance: reportLogInstance]
    }

    def save = {
        def reportLogInstance = new ReportLog(params)
        if (reportLogInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reportLog.label', default: 'ReportLog'), reportLogInstance.id])}"
            redirect(action: "show", id: reportLogInstance.id)
        }
        else {
            render(view: "create", model: [reportLogInstance: reportLogInstance])
        }
    }

    def show = {
        def reportLogInstance = ReportLog.get(params.id)
        if (!reportLogInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportLog.label', default: 'ReportLog'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reportLogInstance: reportLogInstance]
        }
    }

    def edit = {
        def reportLogInstance = ReportLog.get(params.id)
        if (!reportLogInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportLog.label', default: 'ReportLog'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reportLogInstance: reportLogInstance]
        }
    }

    def update = {
        def reportLogInstance = ReportLog.get(params.id)
        if (reportLogInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reportLogInstance.version > version) {
                    
                    reportLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reportLog.label', default: 'ReportLog')] as Object[], "Another user has updated this ReportLog while you were editing")
                    render(view: "edit", model: [reportLogInstance: reportLogInstance])
                    return
                }
            }
            reportLogInstance.properties = params
            if (!reportLogInstance.hasErrors() && reportLogInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reportLog.label', default: 'ReportLog'), reportLogInstance.id])}"
                redirect(action: "show", id: reportLogInstance.id)
            }
            else {
                render(view: "edit", model: [reportLogInstance: reportLogInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportLog.label', default: 'ReportLog'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reportLogInstance = ReportLog.get(params.id)
        if (reportLogInstance) {
            try {
                reportLogInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reportLog.label', default: 'ReportLog'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reportLog.label', default: 'ReportLog'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportLog.label', default: 'ReportLog'), params.id])}"
            redirect(action: "list")
        }
    }
}
