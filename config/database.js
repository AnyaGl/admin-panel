module.exports = ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: {
      host: env('DATABASE_HOST', '127.0.0.1'),
      port: env.int('DATABASE_PORT', 6540),
      database: env('DATABASE_NAME', 'main_db'),
      user: env('DATABASE_USERNAME', 'main_db'),
      password: env('DATABASE_PASSWORD', ''),
      schema: env('DATABASE_SCHEMA', 'product'),
      ssl: env.bool('DATABASE_SSL', false),
    },
  },
});
