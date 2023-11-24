((magit-branch nil)
 (magit-cherry-pick
  ("--ff")
  nil)
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-fetch nil)
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n256"
   ("--" "config/cfg.go")
   "--graph" "--decorate")
  ("-n256"
   ("--" "dql/query_general_worker.go")
   "--graph" "--decorate")
  ("-n256"
   ("--" "workers/task_upload_backup_log.go")
   "--graph" "--decorate")
  ("-n256"
   ("--" "es/es_merged.go")
   "--graph" "--decorate")
  (("--" "magit: kodo"))
  ("-n256"
   ("--" "apis/worker_trigger_metering.go")
   "--graph" "--decorate"))
 (magit-merge nil)
 (magit-pull nil
	     ("--rebase"))
 (magit-push nil
	     ("--force-with-lease"))
 (magit-rebase
  ("--autostash"))
 (magit-remote
  ("-f"))
 (magit-reset nil)
 (magit-revert
  ("--edit")
  nil)
 (magit-stash nil)
 (magit-submodule nil)
 (magit-tag nil)
 (magit:-- "config/cfg.go" "" "dql/query_general_worker.go" "workers/task_upload_backup_log.go" "es/es_merged.go" "apis/worker_trigger_metering.go")
 (magit:--author "yz "))
