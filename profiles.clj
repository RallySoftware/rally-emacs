{:user
 {:plugins      [[lein-ancient "0.6.8"]
                 [quickie "0.4.1"]
                 [lein-cloverage "1.0.6"]]
  :repl-options
  {:init (do (load-file (.getAbsolutePath (clojure.java.io/file (System/getenv "HOME") ".lein/user.clj")))
             (user/inject-repl-utils))}}
 
 :repl
 {:plugins      [[cider/cider-nrepl "0.13.0-SNAPSHOT"]
                 [refactor-nrepl "2.3.0-SNAPSHOT"]
                 [rally-service/lein-template "1.0.0"]]
  :dependencies [[org.clojars.gjahad/debug-repl "0.3.3"]
                 [org.clojure/tools.namespace "0.2.11"]
                 [org.clojure/tools.nrepl "0.2.12"]
                 [im.chit/vinyasa "0.3.4"]
                 [spyscope "0.1.5"]]}}
