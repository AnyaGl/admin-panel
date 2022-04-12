module.exports = ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: {
      host: env('DATABASE_HOST', '185.91.52.146'),
      port: env.int('DATABASE_PORT', 5432),
      database: env('DATABASE_NAME', 'main_db'),
      user: env('DATABASE_USERNAME', 'main_db'),
      password: env('DATABASE_PASSWORD', '1'),
      schema: env('DATABASE_SCHEMA', 'product'),
      ssl: env.bool('DATABASE_SSL', false),
    },
  },
});
