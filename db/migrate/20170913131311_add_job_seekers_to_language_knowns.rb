class AddJobSeekersToLanguageKnowns < ActiveRecord::Migration[5.1]
  def change
    add_reference :language_knowns, :job_seekers, foreign_key: true
  end
end
