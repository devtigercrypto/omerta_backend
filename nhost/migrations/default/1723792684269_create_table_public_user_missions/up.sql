CREATE TABLE "public"."user_missions" ("id" serial NOT NULL, "mission_id" integer NOT NULL, "user_id" uuid NOT NULL, "status" text NOT NULL, "file_url" text, "user_name" text, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("mission_id") REFERENCES "public"."missions"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON UPDATE restrict ON DELETE restrict);
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_user_missions_updated_at"
BEFORE UPDATE ON "public"."user_missions"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_user_missions_updated_at" ON "public"."user_missions"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
