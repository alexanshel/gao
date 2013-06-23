package org.ash.gao.part.param

class DictController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dictInstanceList: Dict.list(params), dictInstanceTotal: Dict.count()]
    }

    def create = {
        def dictInstance = new Dict()
        dictInstance.properties = params
        return [dictInstance: dictInstance]
    }

    def save = {
        def dictInstance = new Dict(params)
        if (dictInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dict.label', default: 'Dict'), dictInstance.id])}"
            redirect(action: "show", id: dictInstance.id)
        }
        else {
            render(view: "create", model: [dictInstance: dictInstance])
        }
    }

    def show = {
        def dictInstance = Dict.get(params.id)
        if (!dictInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dict.label', default: 'Dict'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dictInstance: dictInstance]
        }
    }

    def edit = {
        def dictInstance = Dict.get(params.id)
        if (!dictInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dict.label', default: 'Dict'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dictInstance: dictInstance]
        }
    }

    def update = {
        def dictInstance = Dict.get(params.id)
        if (dictInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dictInstance.version > version) {
                    
                    dictInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dict.label', default: 'Dict')] as Object[], "Another user has updated this Dict while you were editing")
                    render(view: "edit", model: [dictInstance: dictInstance])
                    return
                }
            }
            dictInstance.properties = params
            if (!dictInstance.hasErrors() && dictInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dict.label', default: 'Dict'), dictInstance.id])}"
                redirect(action: "show", id: dictInstance.id)
            }
            else {
                render(view: "edit", model: [dictInstance: dictInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dict.label', default: 'Dict'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dictInstance = Dict.get(params.id)
        if (dictInstance) {
            try {
                dictInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dict.label', default: 'Dict'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dict.label', default: 'Dict'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dict.label', default: 'Dict'), params.id])}"
            redirect(action: "list")
        }
    }
}
