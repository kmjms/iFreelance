RailsAdmin.config do |config|

  require Rails.root.join('lib', 'rails_admin', 'rails_admin_pdf.rb')
  RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Pdf)


  #config.authorize_with do
    #redirect_to main_app.root_path unless current_user.admin = true
  #end


  ### Popular gems integration
  config.navigation_static_links = {
  'UNAL' => 'http://www.unal.edu.co'
}

config.navigation_static_label = "Useful Links"

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  #config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    pdf do
      only Client
    end

    ## With an audit adapter, you can add:
    #history_index
    # history_show
end

config.actions do
  all # NB: comment out this line for RailsAdmin < 0.6.0
  charts
end


config.model KindEntity do
  parent Entity
end

config.model Client do
  parent User
  weight -2
end

config.model Job do
  parent User
  weight -1
end

config.model JobLog do
  parent User
end

config.model Project do
  parent Quotation
  weight -2
 end

end
