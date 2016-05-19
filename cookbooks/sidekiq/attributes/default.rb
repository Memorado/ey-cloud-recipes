#
# Cookbook Name:: sidekiq
# Attrbutes:: default
#

default[:sidekiq] = {
  # Sidekiq will be installed on to application/solo instances,
  # unless a utility name is set, in which case, Sidekiq will
  # only be installed on to a utility instance that matches
  # the name
  :utility_name => 'utility_1',

  # Number of workers (not threads)
  :workers => 1,

  # Concurrency
  :concurrency => 30,

  # Queues
  queues: {
    # :queue_name => priority
    default: 5,
    slow: 2,
    ahoy: 1,
    mailers: 1,
    podio: 2

  },

  # Verbose
  :verbose => false
}
