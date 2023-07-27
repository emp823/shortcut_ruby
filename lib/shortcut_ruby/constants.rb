require 'json'
require 'csv'

module ShortcutRuby
  API_URL = "https://api.app.shortcut.com/api/v3/".freeze

  # Response formats the shortcut api knows about
  FORMATS = {
    json: {
      headers: { header: 'Content-Type', content: 'application/json' },
      parser: JSON
    },
    csv: {
      headers: { header: 'Accept', content: 'text/csv' },
      parser: CSV
    }
  }.freeze

  # Action words are nice for our internal api and match the api path too
  ACTIONS = {
    get: :Get,
    update: :Put,
    delete: :Delete,
    list: :Get,
    create: :Post
  }.freeze

  # These are the resource for the shortcut api and can form part of the path
  RESOURCES = [
    :categories,
    :entity_templates,
    :epics,
    :files,
    :iterations,
    :labels,
    :linked_files,
    :member,
    :members,
    :milestones,
    :projects,
    :repositories,
    :stories,
    :story_links,
    :teams,
    :workflows,
    :tasks,
    :comments,
    :groups
  ].freeze

  # These are the annoying edge cases in the shortcut api that are don't fit
  EXCEPTIONS = {
    bulk_create: {
      path: :bulk,
      action: :Post
    },
    bulk_update: {
      path: :bulk,
      action: :Put
    },
    search_stories: {
      path: 'search/stories',
      action: :Get
    },
    search_epics: {
      path: 'search/epics',
      action: :Get
    },
    search_iterations: {
      path: 'search/iterations',
      action: :Get
    },
    search_milestones: {
      path: 'search/milestones',
      action: :Get
    }
  }.freeze
end
