module ApiHelper
    def authenticated_header(request, user)

        auth_headers = Devise::JWT::TestHelpers.auth_headers({}, user)
        request.headers.merge!(auth_headers)
    end

    def response_json
        JSON.parse(response.body).with_indifferent_access
    end

    def jwt_token(user)
        Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization']
    end
end