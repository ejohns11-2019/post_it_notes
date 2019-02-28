class NotesController < ApplicationController
  def index
    @notes = Note.all #SEQUL of selct * from note
    #create @var and set equal to all of notes
  end

  def show
    #use a single page
    @note = Note.find(params[:id])
    #note.find is active reocrd equivalent
    #use params id because passing in paramet of id for form
  end

  def new
    #Note.create - this adds note to database
    @note = Note.new
    #totally separate instance var
    #stores new note in memory (not in database)
  end

  def create
    @note = Note.new(notes_params)
    #making new note in memory with notes params
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(notes_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_path
  end

  private
    def notes_params
      params.require(:note).permit(:title, :author, :body)
    end
    # back end looks like {note: {title: 'foo', author: ...}}
    #note.new is created with the key value pairs with permit
end
