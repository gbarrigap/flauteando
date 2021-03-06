class Admin::ArtistasVisiblesController < ApplicationController
  before_action :find_encuentro, only: [:create]
  before_action :find_artista_visible, only: [:destroy, :up, :down]

  def create
    av = @encuentro.artistas_visibles.new(artista_visible_params)
    av.orden = (@encuentro.artistas_visibles.count + 1)
    if av.save
      flash.notice = 'El artista seleccionado ya se encuentra visible'
    else
      flash.alert = 'Ocurrió un error visibilizando el artista seleccionado'
    end
    redirect_to admin_encuentro_config_index_path(@encuentro)
  end

  def destroy
    if @artista_visible.destroy
      flash.notice = 'El artista se ha quitado de la página de inicio'
      # Se asegura de numerar consecutivamente el orden
      @artista_visible.encuentro.artistas_visibles.each.with_index(1) do |artista_visible, index|
        artista_visible.orden = index
        artista_visible.save
      end
    else
      flash.alert = 'Ocurrió un error quitando el artista de la página de inicio'
    end
    redirect_to admin_encuentro_config_index_path(@artista_visible.encuentro)
  end

  def up
    @artista_visible.previous.increment!(:orden)
    @artista_visible.decrement!(:orden)
    redirect_to admin_encuentro_config_index_path(@artista_visible.encuentro)
  end

  def down
    @artista_visible.next.decrement!(:orden)
    @artista_visible.increment!(:orden)
    redirect_to admin_encuentro_config_index_path(@artista_visible.encuentro)
  end

  private

  def artista_visible_params
    params.require(:artista_visible).permit(:artista_id)
  end

  def find_encuentro
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

  def find_artista_visible
    @artista_visible = ArtistaVisible.find(params[:id])
  end

end
