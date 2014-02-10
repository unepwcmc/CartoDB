module.exports.base_url     = '/api/:version';
// Regular expression pattern to extract username
// from hostname. Must have a single grabbing block.
module.exports.user_from_host = '^(.*)\\.xxxx\\.yyyy';
module.exports.node_port    = 8080;
module.exports.node_host    = '0.0.0.0';
// idle socket timeout, in miliseconds
module.exports.node_socket_timeout    = 600000;
module.exports.environment  = 'production';
// Supported labels: 'user_id' (read from redis)
module.exports.db_base_name = 'cartodb_user_<%= user_id %>_db';
// Supported labels: 'user_id' (read from redis)
module.exports.db_user      = 'cartodb_user_<%= user_id %>';
// Supported labels: 'user_id', 'user_password' (both read from redis)
module.exports.db_user_pass = '<%= user_password %>'
// Name of the anonymous PostgreSQL user
module.exports.db_pubuser   = 'publicuser';
// Password for the anonymous PostgreSQL user
module.exports.db_pubuser_pass   = 'public';
module.exports.db_host      = 'localhost';
module.exports.db_port      = '6432';
// Max database connections in the pool
// Subsequent connections will wait for a free slot.
// NOTE: not used by OGR-mediated accesses
module.exports.db_pool_size = 500;
// Milliseconds before a connection is removed from pool
module.exports.db_pool_idleTimeout = 30000;
// Milliseconds between idle client checking
module.exports.db_pool_reapInterval = 1000;
module.exports.redis_host   = '127.0.0.1';
module.exports.redis_port   = 6379;
module.exports.redisPool    = 50;
module.exports.redisIdleTimeoutMillis   = 10000;
module.exports.redisReapIntervalMillis  = 1000;
module.exports.redisLog     = false;
// Max number of entries in the query tables cache
module.exports.tableCacheMax = 8192;
// Max age of query table cache items, in milliseconds
module.exports.tableCacheMaxAge = 1000*60*10;
// Temporary directory, make sure it is writable by server user
module.exports.tmpDir = '/tmp';

