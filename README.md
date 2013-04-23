# RailsAdminSlug

A RailsAdmin field type to create a URL slug as you type a page title 

## What is it

Normally when using a gem like FriendlyId, the slug is created server side where the end user has no way of editing what the slug may be. Sure you can have a form field where they can fill in the slug if they so desire, or edit the slug after the model is created. This can lead to confusion and disuse with less technical users. 

This gem brings the slug creation to the client side in RailsAdmin. The slug is automatically created when a user types the model title. From there the slug can be reviewed and edited before initial model creation. 

## Installing

Simply add the gem to your projects Gemfile after the rails_admin line.

    gem "rails_admin_slug"

Create an app/assets/javascripts/rails_admin/custom/ui.js file and add the following line to the top (or just add if the file already exists):

    //=require 'ra.slug'

## Usage

In your RailsAdmin configuration file (usually config/initializers/rails_admin.rb) override the field type for the slug field.
The "source" configuration option defines which field the slug will be tied to and is required to be set.
(On the field line, the first :slug is your slug field, the second in the field type, overriding string in this case.)

    RailsAdmin.config do |config|
      config.model 'Page' do
        edit do
          field :slug, :slug do
            source 'title'
          end
        end
      end
    end

The slug field type extends the string field type. This means it is still possible to set other configuration items.

    RailsAdmin.config do |config|
      config.model 'Page' do
        edit do
          field :slug, :slug do
            source 'title'
            help 'You may edit the slug if you wish'
          end
        end
      end
    end

## Credits

The jquery plugin that creates and edit the client side slug is from Patrick McElhaney and can be found at: https://github.com/pmcelhaney/jQuery-Slugify-Plugin

