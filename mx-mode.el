;; mx-mode.el: A minor mode for Org and OWL2. 
;; by Don Lindsay 2014
;; gpl2 boiler
;; gnu emacs boiler
;; code examples
;; hammertime:

(require 'org)

(define-minor-mode mx-mode "A minor mode for Org and OWL2."
  (message "MX-OWL2: Online")
					; syntax highlighting
					; key bindings
  )

(defvar mx-triple '((mx-org-headline . rdf:first) . (e1)))

					; (cond 
(setq mx-triple '(((mx-org-headline . rdf:rest) '(z2))))
(setq mx-triple '(((z2) rdf:first (e2)) '((z2) rdf:rest . (z3))))
(setq mx-triple '(((zn) rdf:first (en)) '((zn) rdf:rest . rdf:nil))) 

; equivalence
(setq mx-eq-axioms '(
		     (eq-ref   . '(org-entry-put (point) "EQX" "ref"))
		     (eq-sym   . '(org-entry-put (point) "EQ" "sym"))
		     (eq-trans . '(org-entry-put (point) "EQ" "trans"))
		     (eq-rep-s . '(org-entry-put (point) "EQ" "rep-s"))
		     (eq-rep-p . '(org-entry-put (point) "EQ" "rep-p"))
		     (eq-rep-o . '(org-entry-put (point) "EQ" "rep-o"))
		     (eq-diff1 . '(org-entry-put (point) "EQ" "eq-diff1"))
		     (eq-diff2 . '(org-entry-put (point) "EQ" "eq-diff2"))
		     (eq-diff3 . '(org-entry-put (point) "EQ" "eq-diff3"))
		     ))

; property
(setq mx-prp-axioms '(
		      (prp-ap    .'(org-entry-put (point) "PRP" "ap"))
		      (prp-dom   .'(org-entry-put (point) "PRP" "dom"))
		      (prp-rng   .'(org-entry-put (point) "PRP" "rng"))
		      (prp-fp    .'(org-entry-put (point) "PRP" "fp"))
		      (prp-ifp   .'(org-entry-put (point) "PRP" "ifp"))
		      (prp-irp   .'(org-entry-put (point) "PRP" "irp"))
		      (prp-symp  .'(org-entry-put (point) "PRP" "symp"))
		      (prp-asyp  .'(org-entry-put (point) "PRP" "asymp"))
		      (prp-trp   .'(org-entry-put (point) "PRP" "trp"))
		      (prp-spo1  .'(org-entry-put (point) "PRP" "spo1"))
		      (prp-spo2  .'(org-entry-put (point) "PRP" "spo2"))
		      (prp-eqp1  .'(org-entry-put (point) "PRP" "eqp1"))
		      (prp-eqp2  .'(org-entry-put (point) "PRP" "eqp2"))
		      (prp-pdw   .'(org-entry-put (point) "PRP" "pdw"))
		      (prp-adp   .'(org-entry-put (point) "PRP" "adp"))
		      (prp-inv1  .'(org-entry-put (point) "PRP" "inv1"))
		      (prp-inv2  .'(org-entry-put (point) "PRP" "inv2"))
		      (prp-key   .'(org-entry-put (point) "PRP" "key"))
		      (prp-npa1  .'(org-entry-put (point) "PRP" "npa1"))
		      (prp-npa2  .'(org-entry-put (point) "PRP" "npa2"))))

; schema
(scm-cls   .'(org-entry-put (point) "SCM"
(scm-sco   .'(org-entry-put (point) "SCM"
(scm-eqc1  .'(org-entry-put (point) "SCM"
(scm-eqc2  .'(org-entry-put (point) "SCM"
(scm-op    .'(org-entry-put (point) "SCM"
(scm-dp    .'(org-entry-put (point) "SCM"
(scm-spo   . '(org-entry-put (point) "SCM"
(scm-eqp1  . '(org-entry-put (point) "SCM"
(scm-eqp2  .'(org-entry-put (point) "SCM"
(scm-dom1  .'(org-entry-put (point) "SCM"
(scm-dom2  .'(org-entry-put (point) "SCM"
(scm-rng1  .'(org-entry-put (point) "SCM"
(scm-rng2  .'(org-entry-put (point) "SCM"
(scm-hv    .'(org-entry-put (point) "SCM"
(scm-svf1  . '(org-entry-put (point) "SCM"
(scm-svf2  .'(org-entry-put (point) "SCM"
(scm-avf1  .'(org-entry-put (point) "SCM"
(scm-avf2  .'(org-entry-put (point) "SCM"
(scm-int   .'(org-entry-put (point) "SCM"
(scm-uni   .  '(org-entry-put (point) "SCM"


;; ClassAssertion( C a )
;; ObjectPropertyAssertion( OP a1 a2 )
;; DataPropertyAssertion( DP a v ) 
;; SameIndividual( a1 ... an ). 