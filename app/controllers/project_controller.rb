class ProjectController < ApplicationController
    skip_before_action :verify_authenticity_token
    http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params)
    end

    def project_params
        {name: params[:name], description: params[:description], 
        start_date: params[:begining], end_date: params[:ending], state: params[:state]}
    end

    def dashboard
        
        if params[:state].present?
            @projects = Project.where('state = ?', params[:state])
        else
            @projects = Project.all
        end
    end


end
