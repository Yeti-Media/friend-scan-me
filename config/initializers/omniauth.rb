Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'a00ba7e2e72ffe148df27f956e00d4f5', 'f98cd378657bda1c60e9ee561aa29468'
end