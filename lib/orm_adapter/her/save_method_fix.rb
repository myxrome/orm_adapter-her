require 'her/model'

module Her
  module Model

    module SaveFix

      def save(*args)
        super()
      end

    end
    include Her::Model::SaveFix

  end
end
