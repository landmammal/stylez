module BarbersHelper

  def forms_params
    params.require(:barber).permit(:name, :instagram, :phone, :photo, :avatar)
  end

end
