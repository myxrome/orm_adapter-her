require 'her/model'

module Her
  module Model

    module ClassMethods
      include OrmAdapter::ToAdapter

      def model_attributes
        @model_attributes
      end

      def attributes(*args)
        @model_attributes = args
        super(*args)
      end

    end

    class OrmAdapter < ::OrmAdapter::Base

      # Get a list of column/property/field names
      def column_names
        klass.model_attributes
      end

      # Get an instance by id of the model. Raises an error if a model is not found.
      # This should comply with ActiveModel#to_key API, i.e.:
      #
      #   User.to_adapter.get!(@user.to_key) == @user
      #
      def get!(id)
        klass.find(klass.primary_key => wrap_key(id)) || raise(ArgumentError, "#{klass.name} not found with #{klass.primary_key} of #{wrap_key(id)}")
      end

      # Get an instance by id of the model. Returns nil if a model is not found.
      # This should comply with ActiveModel#to_key API, i.e.:
      #
      #   User.to_adapter.get(@user.to_key) == @user
      #
      def get(id)
        klass.find(klass.primary_key => wrap_key(id))
      end

      # Find the first instance, optionally matching conditions, and specifying order
      #
      # You can call with just conditions, providing a hash
      #
      #   User.to_adapter.find_first :name => "Fred", :age => 23
      #
      # Or you can specify :order, and :conditions as keys
      #
      #   User.to_adapter.find_first :conditions => {:name => "Fred", :age => 23}
      #   User.to_adapter.find_first :order => [:age, :desc]
      #   User.to_adapter.find_first :order => :name, :conditions => {:age => 18}
      #
      # When specifying :order, it may be
      # * a single arg e.g. <tt>:order => :name</tt>
      # * a single pair with :asc, or :desc as last, e.g. <tt>:order => [:name, :desc]</tt>
      # * an array of single args or pairs (with :asc or :desc as last), e.g. <tt>:order => [[:name, :asc], [:age, :desc]]</tt>
      #
      def find_first(options = {})
        conditions, order = extract_conditions!(options)
        klass.where(conditions).first
      end

      # Find all models, optionally matching conditions, and specifying order
      # @see OrmAdapter::Base#find_first for how to specify order and conditions
      def find_all(options = {})
        conditions, order = extract_conditions!(options)
        klass.where(conditions).all
      end

      # Create a model using attributes
      def create!(attributes = {})
        klass.create(attributes)
      end

      # Destroy an instance by passing in the instance itself.
      def destroy(object)
        object.destroy if valid_object?(object)
      end

    end
  end
end
