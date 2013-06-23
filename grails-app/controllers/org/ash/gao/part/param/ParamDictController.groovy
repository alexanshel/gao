package org.ash.gao.part.param

class ParamDictController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paramDictInstanceList: ParamDict.list(params), paramDictInstanceTotal: ParamDict.count()]
    }

    def create = {
        def paramDictInstance = new ParamDict()
        paramDictInstance.properties = params
        return [paramDictInstance: paramDictInstance]
    }

    def save = {
        def paramDictInstance = new ParamDict(params)
        if (paramDictInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paramDict.label', default: 'ParamDict'), paramDictInstance.id])}"
            redirect(action: "show", id: paramDictInstance.id)
        }
        else {
            render(view: "create", model: [paramDictInstance: paramDictInstance])
        }
    }

    def show = {
        def paramDictInstance = ParamDict.get(params.id)
        if (!paramDictInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramDict.label', default: 'ParamDict'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paramDictInstance: paramDictInstance]
        }
    }

    def edit = {
        def paramDictInstance = ParamDict.get(params.id)
        if (!paramDictInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramDict.label', default: 'ParamDict'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paramDictInstance: paramDictInstance]
        }
    }

    def update = {
        def paramDictInstance = ParamDict.get(params.id)
        if (paramDictInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paramDictInstance.version > version) {
                    
                    paramDictInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paramDict.label', default: 'ParamDict')] as Object[], "Another user has updated this ParamDict while you were editing")
                    render(view: "edit", model: [paramDictInstance: paramDictInstance])
                    return
                }
            }
            paramDictInstance.properties = params
            if (!paramDictInstance.hasErrors() && paramDictInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paramDict.label', default: 'ParamDict'), paramDictInstance.id])}"
                redirect(action: "show", id: paramDictInstance.id)
            }
            else {
                render(view: "edit", model: [paramDictInstance: paramDictInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramDict.label', default: 'ParamDict'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paramDictInstance = ParamDict.get(params.id)
        if (paramDictInstance) {
            try {
                paramDictInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paramDict.label', default: 'ParamDict'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paramDict.label', default: 'ParamDict'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramDict.label', default: 'ParamDict'), params.id])}"
            redirect(action: "list")
        }
    }
}
