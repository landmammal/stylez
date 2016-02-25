module BarbersHelper

  def form_params
    params.require(:barber).permit(:name, :phone, :instagram, :avatar, :photo)
  end

end
