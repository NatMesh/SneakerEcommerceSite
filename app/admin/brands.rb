ActiveAdmin.register Brand do
  permit_params :name, :image

  #By default we get this form generated but if we want to add custom fields we need to bring it here
  #and then add fields we want to see
  #this is called a DSL(Domain Specific Language)
    #This is being provided by the Formtastic gem to generate this
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      #this generates us another input for our image as a file picker so we can navigate our files for desired image
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
