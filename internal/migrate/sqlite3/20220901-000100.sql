INSERT OR IGNORE INTO auth_users (id, user_uid, super_admin, user_role, display_name, user_slug, username, email, login_attempts, login_at, created_at, updated_at) SELECT id, user_uid, 1, 'admin', full_name, user_name, user_name, primary_email, login_attempts, login_at, created_at, updated_at FROM users WHERE user_name <> '' AND user_name IS NOT NULL AND user_uid <> '' AND user_uid IS NOT NULL AND role_admin = 1 AND user_disabled = 0 ON CONFLICT DO NOTHING;