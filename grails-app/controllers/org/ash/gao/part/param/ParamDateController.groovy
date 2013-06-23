package org.ash.gao.part.param

class ParamDateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paramDateInstanceList: ParamDate.list(params), paramDateInstanceTotal: ParamDate.count()]
    }

    def create = {
        def paramDateInstance = new ParamDate()
        paramDateInstance.properties = params
        return [paramDateInstance: paramDateInstance]
    }

    def save = {
        def paramDateInstance = new ParamDate(params)
        if (paramDateInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paramDate.label', default: 'ParamDate'), paramDateInstance.id])}"
            redirect(action: "show", id: paramDateInstance.id)
        }
        else {
            render(view: "create", model: [paramDateInstance: paramDateInstance])
        }
    }

    def show = {
        def paramDateInstance = ParamDate.get(params.id)
        if (!paramDateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramDate.label', default: 'ParamDate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paramDateInstance: paramDateInstance]
        }
    }

    def edit = {
        def paramDateInstance = ParamDate.get(params.id)
        if (!paramDateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramDate.label', default: 'ParamDate'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paramDateInstance: paramDateInstance]
        }
    }

    def update = {
        def paramDateInstance = ParamDate.get(params.id)
        if (paramDateInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paramDateInstance.version > version) {
                    
                    paramDateInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paramDate.label', default: 'ParamDate')] as Object[], "Another user has updated this ParamDate while you were editing")
                    render(view: "edit", model: [paramDateInstance: paramDateInstance])
                    return
                }
            }
            paramDateInstance.properties = params
            if (!paramDateInstance.hasErrors() && paramDateInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paramDate.label', default: 'ParamDate'), paramDateInstance.id])}"
                redirect(action: "show", id: paramDateInstance.id)
            }
            else {
                render(view: "edit", model: [paramDateInstance: paramDateInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramDate.label', default: 'ParamDate'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paramDateInstance = ParamDate.get(params.id)
        if (paramDateInstance) {
            try {
                paramDateInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paramDate.label', default: 'ParamDate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paramDate.label', default: 'ParamDate'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramDate.label', default: 'ParamDate'), params.id])}"
            redirect(action: "list")
        }
    }
}
