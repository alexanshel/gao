class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
      constraints {
        // apply constraints here
      }
    }
    "/login/$action?"(controller: "login")
    "/logout/$action?"(controller: "logout")
    "/"(controller: "shop", action: "index")
	  "500"(view:'/error')
	}
}
