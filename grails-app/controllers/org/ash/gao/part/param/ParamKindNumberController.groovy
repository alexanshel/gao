package org.ash.gao.part.param

class ParamKindNumberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paramKindNumberInstanceList: ParamKindNumber.list(params), paramKindNumberInstanceTotal: ParamKindNumber.count()]
    }

    def create = {
        def paramKindNumberInstance = new ParamKindNumber()
        paramKindNumberInstance.properties = params
        return [paramKindNumberInstance: paramKindNumberInstance]
    }

    def save = {
        def paramKindNumberInstance = new ParamKindNumber(params)
        if (paramKindNumberInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paramKindNumber.label', default: 'ParamKindNumber'), paramKindNumberInstance.id])}"
            redirect(action: "show", id: paramKindNumberInstance.id)
        }
        else {
            render(view: "create", model: [paramKindNumberInstance: paramKindNumberInstance])
        }
    }

    def show = {
        def paramKindNumberInstance = ParamKindNumber.get(params.id)
        if (!paramKindNumberInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKindNumber.label', default: 'ParamKindNumber'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paramKindNumberInstance: paramKindNumberInstance]
        }
    }

    def edit = {
        def paramKindNumberInstance = ParamKindNumber.get(params.id)
        if (!paramKindNumberInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKindNumber.label', default: 'ParamKindNumber'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paramKindNumberInstance: paramKindNumberInstance]
        }
    }

    def update = {
        def paramKindNumberInstance = ParamKindNumber.get(params.id)
        if (paramKindNumberInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paramKindNumberInstance.version > version) {
                    
                    paramKindNumberInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paramKindNumber.label', default: 'ParamKindNumber')] as Object[], "Another user has updated this ParamKindNumber while you were editing")
                    render(view: "edit", model: [paramKindNumberInstance: paramKindNumberInstance])
                    return
                }
            }
            paramKindNumberInstance.properties = params
            if (!paramKindNumberInstance.hasErrors() && paramKindNumberInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paramKindNumber.label', default: 'ParamKindNumber'), paramKindNumberInstance.id])}"
                redirect(action: "show", id: paramKindNumberInstance.id)
            }
            else {
                render(view: "edit", model: [paramKindNumberInstance: paramKindNumberInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKindNumber.label', default: 'ParamKindNumber'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paramKindNumberInstance = ParamKindNumber.get(params.id)
        if (paramKindNumberInstance) {
            try {
                paramKindNumberInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paramKindNumber.label', default: 'ParamKindNumber'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paramKindNumber.label', default: 'ParamKindNumber'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKindNumber.label', default: 'ParamKindNumber'), params.id])}"
            redirect(action: "list")
        }
    }
}
