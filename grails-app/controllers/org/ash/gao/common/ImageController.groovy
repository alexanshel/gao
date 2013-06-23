package org.ash.gao.common

class ImageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [imageInstanceList: Image.list(params), imageInstanceTotal: Image.count()]
    }

    def create = {
        def imageInstance = new Image()
        imageInstance.properties = params
        return [imageInstance: imageInstance]
    }

    def save = {
        def imageInstance = new Image(params)
        if (imageInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])}"
            redirect(action: "show", id: imageInstance.id)
        }
        else {
            render(view: "create", model: [imageInstance: imageInstance])
        }
    }

    def show = {
        def imageInstance = Image.get(params.id)
        if (!imageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
            redirect(action: "list")
        }
        else {
            [imageInstance: imageInstance]
        }
    }

    def edit = {
        def imageInstance = Image.get(params.id)
        if (!imageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [imageInstance: imageInstance]
        }
    }

    def update = {
        def imageInstance = Image.get(params.id)
        if (imageInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (imageInstance.version > version) {
                    
                    imageInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'image.label', default: 'Image')] as Object[], "Another user has updated this Image while you were editing")
                    render(view: "edit", model: [imageInstance: imageInstance])
                    return
                }
            }
            imageInstance.properties = params
            if (!imageInstance.hasErrors() && imageInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])}"
                redirect(action: "show", id: imageInstance.id)
            }
            else {
                render(view: "edit", model: [imageInstance: imageInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def imageInstance = Image.get(params.id)
        if (imageInstance) {
            try {
                imageInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
            redirect(action: "list")
        }
    }
}
