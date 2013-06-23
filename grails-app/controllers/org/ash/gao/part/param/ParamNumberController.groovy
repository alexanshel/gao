package org.ash.gao.part.param

class ParamNumberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paramNumberInstanceList: ParamNumber.list(params), paramNumberInstanceTotal: ParamNumber.count()]
    }

    def create = {
        def paramNumberInstance = new ParamNumber()
        paramNumberInstance.properties = params
        return [paramNumberInstance: paramNumberInstance]
    }

    def save = {
        def paramNumberInstance = new ParamNumber(params)
        if (paramNumberInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paramNumber.label', default: 'ParamNumber'), paramNumberInstance.id])}"
            redirect(action: "show", id: paramNumberInstance.id)
        }
        else {
            render(view: "create", model: [paramNumberInstance: paramNumberInstance])
        }
    }

    def show = {
        def paramNumberInstance = ParamNumber.get(params.id)
        if (!paramNumberInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramNumber.label', default: 'ParamNumber'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paramNumberInstance: paramNumberInstance]
        }
    }

    def edit = {
        def paramNumberInstance = ParamNumber.get(params.id)
        if (!paramNumberInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramNumber.label', default: 'ParamNumber'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paramNumberInstance: paramNumberInstance]
        }
    }

    def update = {
        def paramNumberInstance = ParamNumber.get(params.id)
        if (paramNumberInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paramNumberInstance.version > version) {
                    
                    paramNumberInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paramNumber.label', default: 'ParamNumber')] as Object[], "Another user has updated this ParamNumber while you were editing")
                    render(view: "edit", model: [paramNumberInstance: paramNumberInstance])
                    return
                }
            }
            paramNumberInstance.properties = params
            if (!paramNumberInstance.hasErrors() && paramNumberInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paramNumber.label', default: 'ParamNumber'), paramNumberInstance.id])}"
                redirect(action: "show", id: paramNumberInstance.id)
            }
            else {
                render(view: "edit", model: [paramNumberInstance: paramNumberInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramNumber.label', default: 'ParamNumber'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paramNumberInstance = ParamNumber.get(params.id)
        if (paramNumberInstance) {
            try {
                paramNumberInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paramNumber.label', default: 'ParamNumber'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paramNumber.label', default: 'ParamNumber'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramNumber.label', default: 'ParamNumber'), params.id])}"
            redirect(action: "list")
        }
    }
}
