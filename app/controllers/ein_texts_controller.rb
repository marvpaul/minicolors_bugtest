class EinTextsController < ApplicationController
  # GET /ein_texts
  # GET /ein_texts.json
  def index
    @ein_texts = EinText.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ein_texts }
    end
  end

  # GET /ein_texts/1
  # GET /ein_texts/1.json
  def show
    @ein_text = EinText.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ein_text }
    end
  end

  # GET /ein_texts/new
  # GET /ein_texts/new.json
  def new
    @ein_text = EinText.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ein_text }
    end
  end

  # GET /ein_texts/1/edit
  def edit
    @aktive_texte = EinText.alle_aktiven
    @ein_text = EinText.find(params[:id])
  end

  # POST /ein_texts
  # POST /ein_texts.json
  def create
    @ein_text = EinText.new(params[:ein_text])

    respond_to do |format|
      if @ein_text.save
        format.html { redirect_to @ein_text, notice: 'Ein text was successfully created.' }
        format.json { render json: @ein_text, status: :created, location: @ein_text }
      else
        format.html { render action: "new" }
        format.json { render json: @ein_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ein_texts/1
  # PUT /ein_texts/1.json
  def update
    @ein_text = EinText.find(params[:id])

    respond_to do |format|
      if @ein_text.update_attributes(params[:ein_text])
        format.html { redirect_to @ein_text, notice: 'Ein text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ein_text.errors, status: :unprocessable_entity }
      end
    end
    #render :action => "farb_aktualisierer.js.erb", :layout => false
  end
  def ajax_update
    p :ZZZZZZZZZZZZZZZZ
    p params[:id]
    @ein_text = EinText.find(params[:id])
    #Farbe updaten
    @ein_text.farbe = params[:farbe]
    @ein_text.save!

    @ein_text.update_attributes(params[:ein_text])
    render :action => "farb_aktualisierer.js.erb", :layout => false
  end
  def text_hinzufuegen
    p :text_hinzufuegen
    p params[:id]
    ein_text = EinText.find(params[:id])
    ein_text.aktiviert = true
    ein_text.save!
    @aktive_texte = EinText.alle_aktiven
    render partial => "edit"
  end
  def text_entfernen
    p :text_entfernen
    ein_text = EinText.find(params[:id])
    ein_text.aktiviert = false
    ein_text.save!
    @aktive_texte = EinText.alle_aktiven
    render partial => "edit"
  end

  # DELETE /ein_texts/1
  # DELETE /ein_texts/1.json
  def destroy
    @ein_text = EinText.find(params[:id])
    @ein_text.destroy

    respond_to do |format|
      format.html { redirect_to ein_texts_url }
      format.json { head :no_content }
    end
  end
end
