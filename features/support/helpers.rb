
class Helpers
    include RSpec::Matchers    
    def criar_dados_contato
        return {
            :nome => Faker::Name.name,
            :email => Faker::Internet.email,
            :assunto => ["Continuous Testing", "Continuous Monitoring", "Mobile Automation", "Continuous Performance"].sample,
        } 
    end

    def validate_response_body(response)

        expect(response['data'].kind_of?(Object)).to eq true

        expect(response['data']['id'].nil?).to eq false
        expect(response['data']['id'].integer?).to eq true
    
        expect(response['data']['nome'].nil?).to eq false
        expect(response['data']['nome'].kind_of?(String)).to eq true
    
        expect(response['data']['email'].nil?).to eq false
        expect(response['data']['email'].kind_of?(String)).to eq true
    
        expect(response['data']['assunto'].nil?).to eq false
        expect(response['data']['assunto'].kind_of?(String)).to eq true
        
        expect(response['data']['created_at'].nil?).to eq false
        expect(response['data']['created_at'].kind_of?(String)).to eq true
        
        expect(response['data']['updated_at'].nil?).to eq false
        expect(response['data']['updated_at'].kind_of?(String)).to eq true
    
        puts "BODY: #{response['data']}"

    end

end