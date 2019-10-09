class CitiesController < ApplicationController
  def view
        @city = params[:city]
    end
    def new
      if params[:name] and params[:landmark] and check_string(params[:population])
          create(params)
      end
    end
    def create(params)
      if not City.all.key?(params[:name].to_sym)
                  city = City.new(
                      name: params[:name],
                      landmark: params[:landmark],
                      population: params[:population],
                  )
                  city.save
              end
              redirect_to "/cities/view"
            end

    def update
        if params[:name] and (params[:landmark] or params[:population])
            update_it(params)
        end
    end
    def update_it(params)
        if City.all[params[:name].to_sym]
            City.all[params[:name].to_sym].update(landmark: params[:landmark], population: params[:population])
        end
        redirect_to "/cities/view"
    end
end
def check_string(string)
  string.scan(/\D/).empty?
end
