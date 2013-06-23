package org.ash.gao.part
import org.ash.gao.part.Part;
import org.ash.gao.part.PartCross;
import org.ash.gao.part.PartType;

import grails.converters.*

class PartController {
  static springSecurityService
  def messageSource
  def partService
  
  static navigation = [
	[
      group:     'main', 
      order:     1, 
      action:    'index',
      title:     'parts',
      path:      'part',
      subItems:  [
        [action: 'dashBoard', title: 'dashBoard'],
        [action: 'list',   title: 'list'],
        [action: 'create', title: 'create']
      ],
      isVisible: {springSecurityService.currentUser != null}
    ]
  ]

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

    def dashBoard() {
      [:]
    }
    

    def list = {
      partService.getFiltred(params)
    }

    def ajaxGetParts = {
      def parts = Part.findAllByOemCodeLike('%' + params.filterValue + '%')
      render parts as JSON
    }
    
    /*
     * Добавляет деталь либо аналог
     */
    def create = {
      // аналог
      def partInstanceCross = Part.get(params.id)
      // новая деталь
      def partInstance = new Part()
      partInstance.properties = params
      if (partInstanceCross) {
        // определяем partCross, если его нет - создаем
        def partCrossInstance = partInstanceCross.cross
        if (!partCrossInstance) {
          partCrossInstance = new PartCross(name: "x")
          if (partCrossInstance.save(flush: true)) {
              flash.message = "опаньки"
          }
          partInstanceCross.cross = partCrossInstance
          partInstanceCross.save(flush: true)
        }
        partInstance.cross = partCrossInstance
        partInstance.type  = partInstanceCross.type
      }
      return [partInstance: partInstance]
    }

    def save = {
        def partInstance = new Part(params)
        if (partInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'part.label', default: 'Part'), partInstance.id])}"
            redirect(action: "show", id: partInstance.id)
        }
        else {
            render(view: "create", model: [partInstance: partInstance])
        }
    }

    def show = {
        def partInstance = Part.get(params.id)
        if (!partInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'part.label', default: 'Part'), params.id])}"
            redirect(action: "list")
        }
        else {
            [partInstance: partInstance]
        }
    }

    def edit = {
        def partInstance = Part.get(params.id)
        if (!partInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'part.label', default: 'Part'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [partInstance: partInstance]
        }
    }

    def update = {
        def partInstance = Part.get(params.id)
        if (partInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (partInstance.version > version) {
                    
                    partInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'part.label', default: 'Part')] as Object[], "Another user has updated this Part while you were editing")
                    render(view: "edit", model: [partInstance: partInstance])
                    return
                }
            }

            //partInstance.locations.clear()
            partInstance.properties = params
            // find the locations that are marked for deletion
            def _toBeDeleted = partInstance.locations.findAll {(it?.deleted || (it == null))}
            // if there are locations to be deleted remove them all
            if (_toBeDeleted) {
              partInstance.locations.removeAll(_toBeDeleted)
            }
            // find the parameters that are marked for deletion
            _toBeDeleted = partInstance.parameters.findAll {(it?.deleted || (it == null))}
            // if there are parameters to be deleted remove them all
            if (_toBeDeleted) {
              partInstance.parameters.removeAll(_toBeDeleted)
            }
            if (!partInstance.hasErrors() && partInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'part.label', default: 'Part'), partInstance.id])}"
                redirect(action: "show", id: partInstance.id)
            }
            else {
                render(view: "edit", model: [partInstance: partInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'part.label', default: 'Part'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def excludeFromCross = {
      def partInstance = Part.get(params.id)
      if (partInstance) {
        try {
          partInstance.cross = null
          if (!partInstance.hasErrors() && partInstance.save(flush: true)) {
              flash.message = "${message(code: 'default.updated.message', args: [message(code: 'part.label', default: 'Part'), partInstance.id])}"
              redirect(action: "show", id: partInstance.id)
          }
        }
        catch (org.springframework.dao.DataIntegrityViolationException e) {
          flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'part.label', default: 'Part'), params.id])}"
          redirect(action: "show", id: params.id)
        }
      }
      redirect(action: "show", id: params.id)
    }

    def delete = {
        def partInstance = Part.get(params.id)
        if (partInstance) {
            try {
                partInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'part.label', default: 'Part'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'part.label', default: 'Part'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'part.label', default: 'Part'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def updateTruncCodes = {
      def parts = Part.list()
      parts.each {
        it.codeTrunc = '1'
        it.save(flush: true)
      }
      redirect(action: list)
    }
  
  def createFlow ={
    // ввод OEM, выбор типа детали
    enterMain {
      on("enterLocations").to "enterLocations"
      on("enterParams").to "enterParams"
      on("enterPartType").to "enterPartType"
      on("save").to "save"
    }
    // добавление на склад
    enterLocations {
    }
    // ввод параметров
    enterParams {
    }
    // ввод типа детали
    enterPartType {
    }
    // сохранение
    save {
    }
  }
}
