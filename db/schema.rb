# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170907230632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "password_digest",                             null: false
    t.string   "auth_token",                                  null: false
    t.string   "first_name",                                  null: false
    t.string   "last_name",                                   null: false
    t.date     "date_of_birth",                               null: false
    t.string   "city"
    t.string   "state_province"
    t.string   "country"
    t.integer  "referred_by"
    t.string   "referred_by_other"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "consent_token"
    t.string   "profile_image"
    t.datetime "pre_survey_completed_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_token_sent_at"
    t.integer  "gender"
    t.string   "last_login_ip"
    t.string   "locale",                       default: "en", null: false
    t.string   "timezone"
    t.boolean  "location_confirmed"
    t.string   "browser_name"
    t.string   "browser_version"
    t.string   "os_name"
    t.string   "os_version"
    t.datetime "email_confirmed_at"
  end

  add_index "accounts", ["auth_token"], name: "index_accounts_on_auth_token", unique: true, using: :btree
  add_index "accounts", ["consent_token"], name: "index_accounts_on_consent_token", unique: true, using: :btree
  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["password_reset_token"], name: "index_accounts_on_password_reset_token", unique: true, using: :btree

  create_table "admin_profiles", force: :cascade do |t|
    t.integer  "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "admin_profiles", ["account_id"], name: "index_admin_profiles_on_account_id", using: :btree

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "background_checks", force: :cascade do |t|
    t.string   "candidate_id",             null: false
    t.string   "report_id",                null: false
    t.integer  "account_id",               null: false
    t.integer  "status",       default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "background_checks", ["account_id"], name: "index_background_checks_on_account_id", using: :btree

  create_table "business_plans", force: :cascade do |t|
    t.string   "uploaded_file"
    t.string   "remote_file_url"
    t.integer  "team_submission_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "file_uploaded"
  end

  add_index "business_plans", ["team_submission_id"], name: "index_business_plans_on_team_submission_id", using: :btree

  create_table "certificates", id: :bigserial, force: :cascade do |t|
    t.integer  "account_id", limit: 8
    t.string   "file"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "season"
    t.integer  "cert_type"
  end

  add_index "certificates", ["account_id"], name: "index_certificates_on_account_id", using: :btree

  create_table "consent_waivers", force: :cascade do |t|
    t.string   "electronic_signature", null: false
    t.integer  "account_id",           null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "voided_at"
  end

  add_index "consent_waivers", ["account_id"], name: "index_consent_waivers_on_account_id", using: :btree

  create_table "divisions", force: :cascade do |t|
    t.integer  "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions_regional_pitch_events", id: false, force: :cascade do |t|
    t.integer "division_id"
    t.integer "regional_pitch_event_id"
  end

  create_table "event_attendances", id: :bigserial, force: :cascade do |t|
    t.integer  "event_id",      limit: 8
    t.string   "attendee_type"
    t.integer  "attendee_id",   limit: 8
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "feedback"
  end

  add_index "event_attendances", ["attendee_type", "attendee_id"], name: "index_event_attendances_on_attendee_type_and_attendee_id", using: :btree
  add_index "event_attendances", ["event_id"], name: "index_event_attendances_on_event_id", using: :btree

  create_table "events", id: :bigserial, force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "title"
    t.string   "place"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "expertises", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exports", force: :cascade do |t|
    t.integer  "account_id",     null: false
    t.string   "file",           null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "download_token"
  end

  create_table "honor_code_agreements", force: :cascade do |t|
    t.integer  "account_id",                           null: false
    t.string   "electronic_signature",                 null: false
    t.boolean  "agreement_confirmed",  default: false, null: false
    t.date     "voided_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "honor_code_agreements", ["account_id"], name: "index_honor_code_agreements_on_account_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "job_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_requests", force: :cascade do |t|
    t.integer  "requestor_id",   null: false
    t.string   "requestor_type", null: false
    t.integer  "joinable_id",    null: false
    t.string   "joinable_type",  null: false
    t.datetime "accepted_at"
    t.datetime "declined_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "deleted_at"
  end

  add_index "join_requests", ["joinable_type", "joinable_id"], name: "index_join_requests_on_joinable_type_and_joinable_id", using: :btree
  add_index "join_requests", ["requestor_type", "requestor_id"], name: "index_join_requests_on_requestor_type_and_requestor_id", using: :btree

  create_table "judge_assignments", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "judge_profile_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "judge_assignments", ["judge_profile_id"], name: "index_judge_assignments_on_judge_profile_id", using: :btree
  add_index "judge_assignments", ["team_id"], name: "index_judge_assignments_on_team_id", using: :btree

  create_table "judge_profiles", force: :cascade do |t|
    t.integer  "account_id",   null: false
    t.string   "company_name", null: false
    t.string   "job_title",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "judge_profiles", ["account_id"], name: "index_judge_profiles_on_account_id", using: :btree

  create_table "judge_profiles_regional_pitch_events", id: false, force: :cascade do |t|
    t.integer "judge_profile_id"
    t.integer "regional_pitch_event_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "member_id",     null: false
    t.string   "member_type",   null: false
    t.integer  "joinable_id",   null: false
    t.string   "joinable_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "memberships", ["joinable_type", "joinable_id"], name: "index_memberships_on_joinable_type_and_joinable_id", using: :btree
  add_index "memberships", ["member_type", "member_id"], name: "index_memberships_on_member_type_and_member_id", using: :btree

  create_table "mentor_profile_expertises", force: :cascade do |t|
    t.integer  "mentor_profile_id", null: false
    t.integer  "expertise_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "mentor_profile_expertises", ["mentor_profile_id"], name: "index_mentor_profile_expertises_on_mentor_profile_id", using: :btree

  create_table "mentor_profiles", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "school_company_name",                    null: false
    t.string   "job_title",                              null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.text     "bio"
    t.boolean  "searchable",             default: false, null: false
    t.boolean  "accepting_team_invites", default: true,  null: false
    t.boolean  "virtual",                default: true,  null: false
    t.boolean  "connect_with_mentors",   default: true,  null: false
  end

  add_index "mentor_profiles", ["account_id"], name: "index_mentor_profiles_on_account_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "regarding_id"
    t.string   "regarding_type"
    t.datetime "sent_at"
    t.datetime "delivered_at"
  end

  create_table "parental_consents", force: :cascade do |t|
    t.string   "electronic_signature", null: false
    t.integer  "student_profile_id",   null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "voided_at"
    t.boolean  "newsletter_opt_in"
  end

  add_index "parental_consents", ["student_profile_id"], name: "index_parental_consents_on_student_profile_id", using: :btree

  create_table "pitch_presentations", force: :cascade do |t|
    t.string   "uploaded_file"
    t.string   "remote_file_url"
    t.integer  "team_submission_id", null: false
    t.boolean  "file_uploaded"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regional_ambassador_profiles", force: :cascade do |t|
    t.string   "organization_company_name",             null: false
    t.string   "ambassador_since_year",                 null: false
    t.string   "job_title",                             null: false
    t.integer  "account_id",                            null: false
    t.integer  "status",                    default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "bio"
  end

  add_index "regional_ambassador_profiles", ["account_id"], name: "index_regional_ambassador_profiles_on_account_id", using: :btree
  add_index "regional_ambassador_profiles", ["status"], name: "index_regional_ambassador_profiles_on_status", using: :btree

  create_table "regional_pitch_events", force: :cascade do |t|
    t.datetime "starts_at",                                      null: false
    t.datetime "ends_at",                                        null: false
    t.integer  "regional_ambassador_profile_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "division_id"
    t.string   "city"
    t.string   "venue_address"
    t.string   "eventbrite_link"
    t.string   "name"
    t.boolean  "unofficial",                     default: false
  end

  add_index "regional_pitch_events", ["division_id"], name: "index_regional_pitch_events_on_division_id", using: :btree

  create_table "regional_pitch_events_teams", id: false, force: :cascade do |t|
    t.integer "regional_pitch_event_id"
    t.integer "team_id"
  end

  add_index "regional_pitch_events_teams", ["regional_pitch_event_id", "team_id"], name: "pitch_events_teams", unique: true, using: :btree
  add_index "regional_pitch_events_teams", ["team_id"], name: "pitch_events_team_ids", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screenshots", force: :cascade do |t|
    t.integer  "team_submission_id"
    t.string   "image"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "sort_position",      default: 0, null: false
  end

  add_index "screenshots", ["team_submission_id"], name: "index_screenshots_on_team_submission_id", using: :btree

  create_table "season_registrations", force: :cascade do |t|
    t.integer  "season_id",                     null: false
    t.integer  "registerable_id",               null: false
    t.string   "registerable_type",             null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "status",            default: 1, null: false
  end

  add_index "season_registrations", ["registerable_id"], name: "season_registerable_ids", using: :btree
  add_index "season_registrations", ["registerable_type"], name: "season_registerable_types", using: :btree
  add_index "season_registrations", ["season_id"], name: "index_season_registrations_on_season_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.integer  "year",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signup_attempts", force: :cascade do |t|
    t.string   "email",                              null: false
    t.string   "activation_token",                   null: false
    t.integer  "account_id"
    t.integer  "status",                 default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "signup_token"
    t.string   "pending_token"
    t.string   "password_digest"
    t.string   "admin_permission_token"
  end

  add_index "signup_attempts", ["status"], name: "index_signup_attempts_on_status", using: :btree

  create_table "student_profiles", force: :cascade do |t|
    t.integer  "account_id",            null: false
    t.string   "parent_guardian_email"
    t.string   "parent_guardian_name"
    t.string   "school_name",           null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "student_profiles", ["account_id"], name: "index_student_profiles_on_account_id", using: :btree

  create_table "submission_scores", force: :cascade do |t|
    t.integer  "team_submission_id"
    t.integer  "judge_profile_id"
    t.integer  "sdg_alignment",                default: 0
    t.integer  "evidence_of_problem",          default: 0
    t.integer  "problem_addressed",            default: 0
    t.integer  "app_functional",               default: 0
    t.integer  "demo_video",                   default: 0
    t.integer  "business_plan_short_term",     default: 0
    t.integer  "business_plan_long_term",      default: 0
    t.integer  "market_research",              default: 0
    t.integer  "viable_business_model",        default: 0
    t.integer  "problem_clearly_communicated", default: 0
    t.integer  "compelling_argument",          default: 0
    t.integer  "passion_energy",               default: 0
    t.integer  "pitch_specific",               default: 0
    t.integer  "business_plan_feasible",       default: 0
    t.integer  "submission_thought_out",       default: 0
    t.integer  "cohesive_story",               default: 0
    t.integer  "solution_originality",         default: 0
    t.integer  "solution_stands_out",          default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.text     "ideation_comment"
    t.text     "technical_comment"
    t.text     "entrepreneurship_comment"
    t.text     "pitch_comment"
    t.text     "overall_comment"
    t.datetime "completed_at"
    t.string   "event_type"
    t.datetime "deleted_at"
    t.integer  "round",                        default: 0,    null: false
    t.boolean  "official",                     default: true
  end

  add_index "submission_scores", ["completed_at"], name: "index_submission_scores_on_completed_at", using: :btree
  add_index "submission_scores", ["judge_profile_id"], name: "index_submission_scores_on_judge_profile_id", using: :btree
  add_index "submission_scores", ["team_submission_id"], name: "index_submission_scores_on_team_submission_id", using: :btree

  create_table "team_member_invites", force: :cascade do |t|
    t.integer  "inviter_id",                null: false
    t.integer  "team_id",                   null: false
    t.string   "invitee_email"
    t.integer  "invitee_id"
    t.string   "invite_token",              null: false
    t.integer  "status",        default: 0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "invitee_type"
    t.string   "inviter_type"
  end

  add_index "team_member_invites", ["invite_token"], name: "index_team_member_invites_on_invite_token", unique: true, using: :btree
  add_index "team_member_invites", ["status"], name: "index_team_member_invites_on_status", using: :btree

  create_table "team_submissions", force: :cascade do |t|
    t.boolean  "integrity_affirmed",                                                              default: false, null: false
    t.integer  "team_id",                                                                                         null: false
    t.datetime "created_at",                                                                                      null: false
    t.datetime "updated_at",                                                                                      null: false
    t.string   "source_code"
    t.string   "source_code_external_url"
    t.text     "app_description"
    t.integer  "stated_goal"
    t.text     "stated_goal_explanation"
    t.string   "app_name"
    t.string   "demo_video_link"
    t.string   "pitch_video_link"
    t.string   "development_platform_other"
    t.integer  "development_platform"
    t.boolean  "source_code_file_uploaded"
    t.string   "slug"
    t.integer  "submission_scores_count"
    t.integer  "judge_opened_id"
    t.datetime "judge_opened_at"
    t.decimal  "quarterfinals_average_score",                             precision: 5, scale: 2, default: 0.0,   null: false
    t.decimal  "average_unofficial_score",                                precision: 5, scale: 2, default: 0.0,   null: false
    t.integer  "contest_rank",                                                                    default: 0,     null: false
    t.integer  "complete_semifinals_submission_scores_count",                                     default: 0,     null: false
    t.integer  "complete_quarterfinals_submission_scores_count",                                  default: 0,     null: false
    t.decimal  "semifinals_average_score",                                precision: 5, scale: 2, default: 0.0,   null: false
    t.integer  "complete_semifinals_official_submission_scores_count",                            default: 0,     null: false
    t.integer  "complete_quarterfinals_official_submission_scores_count",                         default: 0,     null: false
    t.integer  "pending_semifinals_submission_scores_count",                                      default: 0,     null: false
    t.integer  "pending_quarterfinals_submission_scores_count",                                   default: 0,     null: false
    t.integer  "pending_semifinals_official_submission_scores_count",                             default: 0,     null: false
    t.integer  "pending_quarterfinals_official_submission_scores_count",                          default: 0,     null: false
    t.datetime "deleted_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",                                      null: false
    t.text     "description"
    t.integer  "division_id",                               null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "team_photo"
    t.string   "legacy_id"
    t.boolean  "accepting_student_requests", default: true, null: false
    t.boolean  "accepting_mentor_requests",  default: true, null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state_province"
    t.string   "country"
    t.datetime "deleted_at"
  end

  add_index "teams", ["legacy_id"], name: "index_teams_on_legacy_id", using: :btree

  create_table "technical_checklists", force: :cascade do |t|
    t.boolean  "used_strings"
    t.string   "used_strings_explanation"
    t.boolean  "used_numbers"
    t.string   "used_numbers_explanation"
    t.boolean  "used_variables"
    t.string   "used_variables_explanation"
    t.boolean  "used_lists"
    t.string   "used_lists_explanation"
    t.boolean  "used_booleans"
    t.string   "used_booleans_explanation"
    t.boolean  "used_loops"
    t.string   "used_loops_explanation"
    t.boolean  "used_conditionals"
    t.string   "used_conditionals_explanation"
    t.boolean  "used_local_db"
    t.string   "used_local_db_explanation"
    t.boolean  "used_external_db"
    t.string   "used_external_db_explanation"
    t.boolean  "used_location_sensor"
    t.string   "used_location_sensor_explanation"
    t.boolean  "used_camera"
    t.string   "used_camera_explanation"
    t.boolean  "used_accelerometer"
    t.string   "used_accelerometer_explanation"
    t.boolean  "used_sms_phone"
    t.string   "used_sms_phone_explanation"
    t.boolean  "used_sound"
    t.string   "used_sound_explanation"
    t.boolean  "used_sharing"
    t.string   "used_sharing_explanation"
    t.string   "paper_prototype"
    t.integer  "team_submission_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "event_flow_chart"
    t.boolean  "used_clock"
    t.string   "used_clock_explanation"
    t.boolean  "used_canvas"
    t.string   "used_canvas_explanation"
  end

  add_index "technical_checklists", ["team_submission_id"], name: "index_technical_checklists_on_team_submission_id", using: :btree

  create_table "unconfirmed_email_addresses", id: :bigserial, force: :cascade do |t|
    t.string   "email"
    t.integer  "account_id",         limit: 8
    t.string   "confirmation_token"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "unconfirmed_email_addresses", ["account_id"], name: "index_unconfirmed_email_addresses_on_account_id", using: :btree

  add_foreign_key "admin_profiles", "accounts"
  add_foreign_key "background_checks", "accounts"
  add_foreign_key "business_plans", "team_submissions"
  add_foreign_key "certificates", "accounts"
  add_foreign_key "consent_waivers", "accounts"
  add_foreign_key "divisions_regional_pitch_events", "divisions"
  add_foreign_key "divisions_regional_pitch_events", "regional_pitch_events"
  add_foreign_key "event_attendances", "events"
  add_foreign_key "exports", "accounts"
  add_foreign_key "join_requests", "teams", column: "joinable_id"
  add_foreign_key "judge_assignments", "judge_profiles"
  add_foreign_key "judge_assignments", "teams"
  add_foreign_key "mentor_profile_expertises", "expertises"
  add_foreign_key "mentor_profile_expertises", "mentor_profiles"
  add_foreign_key "mentor_profiles", "accounts"
  add_foreign_key "parental_consents", "student_profiles"
  add_foreign_key "regional_pitch_events", "divisions"
  add_foreign_key "regional_pitch_events_teams", "regional_pitch_events"
  add_foreign_key "regional_pitch_events_teams", "teams"
  add_foreign_key "screenshots", "team_submissions"
  add_foreign_key "season_registrations", "seasons"
  add_foreign_key "signup_attempts", "accounts"
  add_foreign_key "submission_scores", "judge_profiles"
  add_foreign_key "submission_scores", "team_submissions"
  add_foreign_key "team_submissions", "teams"
  add_foreign_key "teams", "divisions"
  add_foreign_key "technical_checklists", "team_submissions"
  add_foreign_key "unconfirmed_email_addresses", "accounts"
end
