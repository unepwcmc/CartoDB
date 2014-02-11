var config = {
    environment: 'production'
    ,port: 8181
    ,host: '0.0.0.0'
    // Regular expression pattern to extract username
    // from hostname. Must have a single grabbing block.
    ,user_from_host: '^(.*)\\.xxxx\\.yyyy';
    // Maximum number of connections for one process
    // 128 is a good value with a limit of 1024 open file descriptors
    ,maxConnections:128
    // idle socket timeout, in miliseconds
    ,socket_timeout: 600000
    ,enable_cors: true
    ,cache_enabled: true
    ,log_format: '[:date] :req[X-Real-IP] :method :req[Host]:url :status :response-time ms -> :res[Content-Type] (:res[X-Tiler-Profiler])'
    // Templated database username for authorized user
    // Supported labels: 'user_id' (read from redis)
    ,postgres_auth_user: 'cartodb_user_<%= user_id %>'
    // Templated database password for authorized user
    // Supported labels: 'user_id', 'user_password' (both read from redis)
    ,postgres_auth_pass: '<%= user_password %>'
    ,postgres: {
        // Parameters to pass to datasource plugin of mapnik
        // See http://github.com/mapnik/mapnik/wiki/PostGIS
        user: "publicuser",
        password: "public",
        host: '127.0.0.1',
        port: 6432,
        extent: "-20037508.3,-20037508.3,20037508.3,20037508.3",
        row_limit: 65535,
        simplify_geometries: true,
        max_size: 500
    }
    ,mapnik_version: undefined
    ,renderer: {
      // Milliseconds since last access before renderer cache item expires
      cache_ttl: 60000,
      metatile: 4,
      bufferSize: 64
    }
    ,millstone: {
        // Needs to be writable by server user
        cache_basedir: '/home/ubuntu/tile_assets/'
    }

    ,redis: {
        host: '127.0.0.1',
        port: 6379,
        // Max number of connections in each pool.
        // Users will be put on a queue when the limit is hit.
        // Set to maxConnection to have no possible queues.
        // There are currently 3 pools involved in serving
        // windshaft-cartodb requests so multiply this number
        // by 3 to know how many possible connections will be
        // kept open by the server. The default is 50.
        max: 50,
        idleTimeoutMillis: 30000, // idle time before dropping connection
        reapIntervalMillis: 1000 // time between cleanups
    }
    ,sqlapi: {
        protocol: 'http',
        // If "host" is given, it will be used
        // to connect to the SQL-API without a
        // DNS lookup
        //host: '127.0.0.1',
        port: 8080,
        // The "domain" part will be appended to
        // the cartodb username and passed to
        // SQL-API requests in the Host HTTP header
        domain: 'xxxx.yyyy',
        version: 'v2'
    }
    ,varnish: {
        host: 'localhost',
        port: 6082,
        ttl: 86400
    }

    // If useProfiler is true every response will be served with an
    // X-Tiler-Profile header containing elapsed timing for various
    // steps taken for producing the response.
    ,useProfiler:false
};

module.exports = config;


