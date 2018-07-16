class ContatoApi
    include HTTParty

    base_uri 'http://localhost:3090/api/v1'
    format :json
    headers 'Content-Type' => 'application/json', 
            'User-agent' => 'tdc_user'
  
    def get_all_contacts
        self.class.get("/contacts")
    end
  
    def get_contact(index)
        self.class.get("/contacts/#{index}")
    end
  
    def post_contact(body_request)
        self.class.post("/contacts/", body: body_request.to_json)
    end

    def update_contact(index, body_request)
        self.class.put("/contacts/#{index}", body: body_request.to_json)
    end    

    def delete_contact(index)
        self.class.delete("/contacts/#{index}")
    end        

  end