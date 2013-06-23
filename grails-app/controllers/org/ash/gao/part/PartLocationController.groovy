package org.ash.gao.part

import org.ash.gao.part.PartLocation;

class PartLocationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [partLocationInstanceList: PartLocation.list(params), partLocationInstanceTotal: PartLocation.count()]
    }

    def create = {
        def partLocationInstance = new PartLocation()
        partLocationInstance.properties = params
        return [partLocationInstance: partLocationInstance]
    }

    def save = {
        def partLocationInstance = new PartLocation(params)
        if (partLocationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'partLocation.label', default: 'PartLocation'), partLocationInstance.id])}"
            redirect(action: "show", id: partLocationInstance.id)
        }
        else {
            render(view: "create", model: [partLocationInstance: partLocationInstance])
        }
    }

    def show = {
        def partLocationInstance = PartLocation.get(params.id)
        if (!partLocationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partLocation.label', default: 'PartLocation'), params.id])}"
            redirect(action: "list")
        }
        else {
            [partLocationInstance: partLocationInstance]
        }
    }

    def edit = {
        def partLocationInstance = PartLocation.get(params.id)
        if (!partLocationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partLocation.label', default: 'PartLocation'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [partLocationInstance: partLocationInstance]
        }
    }

    def update = {
        def partLocationInstance = PartLocation.get(params.id)
        if (partLocationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (partLocationInstance.version > version) {
                    
                    partLocationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'partLocation.label', default: 'PartLocation')] as Object[], "Another user has updated this PartLocation while you were editing")
                    render(view: "edit", model: [partLocationInstance: partLocationInstance])
                    return
                }
            }
            partLocationInstance.properties = params
            if (!partLocationInstance.hasErrors() && partLocationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'partLocation.label', default: 'PartLocation'), partLocationInstance.id])}"
                redirect(action: "show", id: partLocationInstance.id)
            }
            else {
                render(view: "edit", model: [partLocationInstance: partLocationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partLocation.label', default: 'PartLocation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def partLocationInstance = PartLocation.get(params.id)
        if (partLocationInstance) {
            try {
                partLocationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'partLocation.label', default: 'PartLocation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'partLocation.label', default: 'PartLocation'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partLocation.label', default: 'PartLocation'), params.id])}"
            redirect(action: "list")
        }
    }
}
