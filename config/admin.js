module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '5c5d78c25d40b19f3deb2ced61467122'),
  },
});
