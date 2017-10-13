module RailsAdminPdf
end

require 'rails_admin/config/actions'
require 'prawn'
require 'gruff'

module RailsAdmin
  module Config
    module Actions
      class Pdf < Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          Proc.new do

            # Configurando PDF
            PDF_OPTIONS = {
              :page_size   => "A4",
              :page_layout => :portrait,
              :margin      => [40, 75]
            }

            # Configurando Retorno
            ramdom_file_name = (0...8).map { (65 + rand(26)).chr }.join

            Prawn::Document.new(PDF_OPTIONS) do |pdf|
              pdf.fill_color "666666"
              pdf.text "iFreelance", :size => 32, :style => :bold, :align => :center
              pdf.move_down 80

              pdf.text "Datos Personales", :size => 14, :align => :justify, :inline_format => true, :style => :bold
              pdf.move_down 14

              if @object.name
                pdf.text "Nombre: #{@object.name}", :size => 12, :align => :justify, :inline_format => true
                pdf.move_down 8
              end
              # Muda de font para Helvetica
             pdf.font "Helvetica"
             # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
             pdf.text "Link Para o Manul do Prawn<link href='http://prawnpdf.org/manual.pdf'> <color rgb='5ca3e6'>clicável</color></link>", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
             # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
             pdf.number_pages "Generado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
             # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
             pdf.render_file("public/#{ramdom_file_name}.pdf")
           end

           File.open("public/#{ramdom_file_name}.pdf", 'r') do |f|
             send_data f.read.force_encoding('BINARY'), :filename => 'pdf', :type => "application/pdf", :disposition => "attachment"
           end
           File.delete("public/#{ramdom_file_name}.pdf")
           #File.delete("public/#{ramdom_file_name}_graph.jpg") if @object.sales.count > 0
         end
       end

       register_instance_option :link_icon do
         'fa fa-file-pdf-o'

          end
         end
       end
     end
   end
