(defun mx/rdf-startup ()
  "Activate the MX-RDF subsystem."
  (interactive)
  (message "MX-RDF: ONLINE"))

(defvar mx-rdf-startup
  (cond
   (overview t)
   (hideblocks t)
   (org-mode t)
   
   mx-rdf-startup "ONLINE")

(defun mx/insert-drawer ()
  (org-insert-property-drawer))

(defvar mx-rdf-drawer (drawer)
  '((org-insert-drawer . '((mx-org-hidden       . nil)
			   (mx-org-state        . nil)
			   (mx-org-properties   . nil)
			   (mx-rdfs-owl2        . nil)
			   (mx-n3               . nil))
		       )))



(defun mx/org-header-args ()
  (setq mx-org-src-block-properties
	'((mx-org-header-arg . '((:export . results)
				 (:header-args . mx-rdf)
				 (:session . *mx-rdf*))
			     )
	  )
	)
  )

(defun mx/org-rdf-properties () 
  (setq mx-org-rdf-properties . '(:see-also
  . org-property-allowed-value-functions)))

(defun mx/org-global-properties ()
  "'List of property/value pairs that can be inherited by any entry.
This list will be combined with the constant
`org-global-properties-fixed'.  The entries in this list are cons
cells where the car is a property name and cdr is a string with
the value.'  

Note: it might make sense to make a separate file for holding the
list since it might be somewhat long and can be imported.A
related question is if you want to define all the owl2 and rdfs
only tags."
  (setq org-global-properties
	'((mx-org-n3-triple . '((mx-subject     . nil)
				(mx-predicate   . nil)
				(mx-object . nil)) ) ) ) )
	
(defvar BEGIN_EXAMPLE (mx-rdf mx-rdf-property drawer)
  '((owl2-rdfs . '((doc-string  . "rdfs and owl2 markup element drawer")
                   (mx-rdf-type  . drawer))
	       )
    )
  )

(defvar END_EXAMPLE (mx-rdf mx-rdf-property drawer)
  '((owl2-rdfs . '((doc-string  . "rdfs and owl2 markup element drawer")
                   (mx-rdf-type . drawer)) ) ) )

(defvar mx-rdf-properties
  '((mx-rdf_all . mx-rdfs-type)
    (mx-rdf+    . mx-n3-predicate)
    (mx-rdf+    . mx-rdf-type)
    )
  )

(defun  or elisp via org-file-properties
   
     "You can set buffer-local values for the same purpose in the variable
     `org-file-properties' this by adding lines like
   
     (defvar PROPERTY: NAME VALUE"

org-entry-put-multivalued-property pom property &rest values

(defun  calls 
  
   "(defvar call [<inside header arguments>] (<arguments>) <end header arguments>"




(defun  tasks 
(defun  dfa-dg.org
This file has mainly become about deterministic finite automata and
directed graphs. This is progress because my targets have been source
blocks and n3. (defvar begin_src might read as (defvar deterministic-finite-automata
and n3 might read as directed-graph. My current interest is developing
this code along those lines and with a focus on producing code that i
can load into gruff, which at this point means turtle and hence, n3.

(defun  determine the significance of (:how) (:what) and (seq (:how :much))
(defun  TODO do i want a (defvar property: list of all owl2 and rdfs? 

(defvar property: mx-rdf_all          mx-rdf-rdfs-type
(defvar property: mx-rdf+             mx-rdf-predicate
(defvar property: mx-rdf-predicate    rdfs-type

(defun  drawers
(defvar drawer:   hidden state


(defun  (defun  owl2 in n3

(defun '(mx-rdf-owl2-AllDifferent '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-AllDifferent rdfs:subClassOf mx-rdfs-resource .

'(mx-rdf-owl2-AllDisjointClasses '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-AllDisjointClasses mx-rdfs-subClassOf mx-rdfs-resource .

'(mx-rdf-owl2-AllDisjointProperties '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-AllDisjointProperties mx-rdfs-subClassOf mx-rdfs-resource .

'(mx-rdf-owl2-Annotation '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-Annotation mx-rdfs-subClassOf mx-rdfs-resource .

'(mx-rdf-owl2-AnnotationProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-AnnotationProperty mx-rdfs-subClassOf rdf:Property .

'(mx-rdf-owl2-AsymmetricProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-AsymmetricProperty mx-rdfs-subClassOf '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-Axiom '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-Axiom mx-rdfs-subClassOf mx-rdfs-resource .

'(mx-rdf-owl2-Class '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-Class mx-rdfs-subClassOf 'mx-rdfs-class) .

'(mx-rdf-owl2-DataRange '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-DataRange mx-rdfs-subClassOf mx-rdf-Datatype .

'(mx-rdf-owl2-DatatypeProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-DatatypeProperty mx-rdfs-subClassOf rdf:Property .

'(mx-rdf-owl2-DeprecatedClass '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-DeprecatedClass mx-rdfs-subClassOf 'mx-rdfs-class) .

'(mx-rdf-owl2-DeprecatedProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-DeprecatedProperty mx-rdfs-subClassOf rdf:Property .

'(mx-rdf-owl2-FunctionalProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-FunctionalProperty mx-rdfs-subClassOf rdf:Property .

'(mx-rdf-owl2-InverseFunctionalProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-InverseFunctionalProperty mx-rdfs-subClassOf '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-IrreflexiveProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-IrreflexiveProperty mx-rdfs-subClassOf '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-NamedIndividual '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-NamedIndividual mx-rdfs-subClassOf '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-NegativePropertyAssertion '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-NegativePropertyAssertion mx-rdfs-subClassOf mx-rdfs-resource .

'(mx-rdf-owl2-Nothing '((mx-rdf-type . '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-Nothing mx-rdfs-subClassOf '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-ObjectProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-ObjectProperty mx-rdfs-subClassOf rdf:Property .

'(mx-rdf-owl2-Ontology '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-Ontology mx-rdfs-subClassOf mx-rdfs-resource .

'(mx-rdf-owl2-OntologyProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-OntologyProperty mx-rdfs-subClassOf rdf:Property .

'(mx-rdf-owl2-ReflexiveProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-ReflexiveProperty mx-rdfs-subClassOf '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-Restriction '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-Restriction mx-rdfs-subClassOf '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-SymmetricProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-SymmetricProperty mx-rdfs-subClassOf '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-Thing '((mx-rdf-type . '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-TransitiveProperty '((mx-rdf-type . 'mx-rdfs-class) .

'(mx-rdf-owl2-TransitiveProperty mx-rdfs-subClassOf '(mx-rdf-owl2-ObjectProperty .

(defun (defun  Axiomatic Triples for the Properties

'(mx-rdf-owl2-allValuesFrom '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-allValuesFrom mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-allValuesFrom mx-rdf-range 'mx-rdfs-class) .

'(mx-rdf-owl2-annotatedProperty '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-annotatedProperty mx-rdf-domain mx-rdfs-resource .

'(mx-rdf-owl2-annotatedProperty mx-rdf-range mx-rdfs-resource .

'(mx-rdf-owl2-annotatedSource '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-annotatedSource mx-rdf-domain mx-rdfs-resource .

'(mx-rdf-owl2-annotatedSource mx-rdf-range mx-rdfs-resource .

'(mx-rdf-owl2-annotatedTarget '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-annotatedTarget mx-rdf-domain mx-rdfs-resource .

'(mx-rdf-owl2-annotatedTarget mx-rdf-range mx-rdfs-resource .

'(mx-rdf-owl2-assertionProperty '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-assertionProperty mx-rdf-domain '(mx-rdf-owl2-NegativePropertyAssertion .

'(mx-rdf-owl2-assertionProperty mx-rdf-range rdf:Property .

'(mx-rdf-owl2-backwardCompatibleWith '((mx-rdf-type . '(mx-rdf-owl2-AnnotationProperty .

'(mx-rdf-owl2-backwardCompatibleWith '((mx-rdf-type . '(mx-rdf-owl2-OntologyProperty .

'(mx-rdf-owl2-backwardCompatibleWith mx-rdf-domain '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-backwardCompatibleWith mx-rdf-range '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-bottomDataProperty '((mx-rdf-type . '(mx-rdf-owl2-DatatypeProperty .

'(mx-rdf-owl2-bottomDataProperty mx-rdf-domain '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-bottomDataProperty mx-rdf-range mx-rdf-Literal .

'(mx-rdf-owl2-bottomObjectProperty '((mx-rdf-type . '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-bottomObjectProperty mx-rdf-domain '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-bottomObjectProperty mx-rdf-range '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-cardinality '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-cardinality mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-cardinality mx-rdf-range xsd:nonNegativeInteger .

'(mx-rdf-owl2-complementOf '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-complementOf mx-rdf-domain '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-complementOf mx-rdf-range '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-datatypeComplementOf '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-datatypeComplementOf mx-rdf-domain mx-rdf-Datatype .

'(mx-rdf-owl2-datatypeComplementOf mx-rdf-range mx-rdf-Datatype .

'(mx-rdf-owl2-deprecated '((mx-rdf-type . '(mx-rdf-owl2-AnnotationProperty .

'(mx-rdf-owl2-deprecated mx-rdf-domain mx-rdfs-resource .

'(mx-rdf-owl2-deprecated mx-rdf-range mx-rdfs-resource .

'(mx-rdf-owl2-differentFrom '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-differentFrom mx-rdf-domain '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-differentFrom mx-rdf-range '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-disjointUnionOf '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-disjointUnionOf mx-rdf-domain '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-disjointUnionOf mx-rdf-range rdf:List .

'(mx-rdf-owl2-disjointWith '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-disjointWith mx-rdf-domain '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-disjointWith mx-rdf-range '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-distinctMembers '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-distinctMembers mx-rdf-domain '(mx-rdf-owl2-AllDifferent .

'(mx-rdf-owl2-distinctMembers mx-rdf-range rdf:List .

'(mx-rdf-owl2-equivalentClass '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-equivalentClass mx-rdf-domain 'mx-rdfs-class) .

'(mx-rdf-owl2-equivalentClass mx-rdf-range 'mx-rdfs-class) .

'(mx-rdf-owl2-equivalentProperty '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-equivalentProperty mx-rdf-domain rdf:Property .

'(mx-rdf-owl2-equivalentProperty mx-rdf-range rdf:Property .

'(mx-rdf-owl2-hasKey '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-hasKey mx-rdf-domain '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-hasKey mx-rdf-range rdf:List .

'(mx-rdf-owl2-hasSelf '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-hasSelf mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-hasSelf mx-rdf-range mx-rdfs-resource .

'(mx-rdf-owl2-hasValue '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-hasValue mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-hasValue mx-rdf-range mx-rdfs-resource .

'(mx-rdf-owl2-imports '((mx-rdf-type . '(mx-rdf-owl2-OntologyProperty .

'(mx-rdf-owl2-imports mx-rdf-domain '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-imports mx-rdf-range '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-incompatibleWith '((mx-rdf-type . '(mx-rdf-owl2-AnnotationProperty .

'(mx-rdf-owl2-incompatibleWith '((mx-rdf-type . '(mx-rdf-owl2-OntologyProperty .

'(mx-rdf-owl2-incompatibleWith mx-rdf-domain '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-incompatibleWith mx-rdf-range '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-intersectionOf '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-intersectionOf mx-rdf-domain 'mx-rdfs-class) .

'(mx-rdf-owl2-intersectionOf mx-rdf-range rdf:List .

'(mx-rdf-owl2-inverseOf '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-inverseOf mx-rdf-domain '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-inverseOf mx-rdf-range '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-maxCardinality '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-maxCardinality mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-maxCardinality mx-rdf-range xsd:nonNegativeInteger .

'(mx-rdf-owl2-maxQualifiedCardinality '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-maxQualifiedCardinality mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-maxQualifiedCardinality mx-rdf-range xsd:nonNegativeInteger .

'(mx-rdf-owl2-members '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-members mx-rdf-domain mx-rdfs-resource .

'(mx-rdf-owl2-members mx-rdf-range rdf:List .

'(mx-rdf-owl2-minCardinality '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-minCardinality mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-minCardinality mx-rdf-range xsd:nonNegativeInteger .

'(mx-rdf-owl2-minQualifiedCardinality '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-minQualifiedCardinality mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-minQualifiedCardinality mx-rdf-range xsd:nonNegativeInteger .

'(mx-rdf-owl2-onClass '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-onClass mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-onClass mx-rdf-range '(mx-rdf-owl2-Class .

'(mx-rdf-owl2-onDataRange '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-onDataRange mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-onDataRange mx-rdf-range mx-rdf-Datatype .

'(mx-rdf-owl2-onDatatype '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-onDatatype mx-rdf-domain mx-rdf-Datatype .

'(mx-rdf-owl2-onDatatype mx-rdf-range mx-rdf-Datatype .

'(mx-rdf-owl2-oneOf '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-oneOf mx-rdf-domain 'mx-rdfs-class) .

'(mx-rdf-owl2-oneOf mx-rdf-range rdf:List .

'(mx-rdf-owl2-onProperty '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-onProperty mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-onProperty mx-rdf-range rdf:Property .

'(mx-rdf-owl2-onProperties '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-onProperties mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-onProperties mx-rdf-range rdf:List .

'(mx-rdf-owl2-priorVersion '((mx-rdf-type . '(mx-rdf-owl2-AnnotationProperty .

'(mx-rdf-owl2-priorVersion '((mx-rdf-type . '(mx-rdf-owl2-OntologyProperty .

'(mx-rdf-owl2-priorVersion mx-rdf-domain '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-priorVersion mx-rdf-range '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-propertyChainAxiom '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-propertyChainAxiom mx-rdf-domain '(mx-rdf-owl2-ObjectProperty .

'(mx-rdf-owl2-propertyChainAxiom mx-rdf-range rdf:List .

'(mx-rdf-owl2-propertyDisjointWith '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-propertyDisjointWith mx-rdf-domain rdf:Property .

'(mx-rdf-owl2-propertyDisjointWith mx-rdf-range rdf:Property .

'(mx-rdf-owl2-qualifiedCardinality '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-qualifiedCardinality mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-qualifiedCardinality mx-rdf-range xsd:nonNegativeInteger .

'(mx-rdf-owl2-sameAs '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-sameAs mx-rdf-domain '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-sameAs mx-rdf-range '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-someValuesFrom '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-someValuesFrom mx-rdf-domain '(mx-rdf-owl2-Restriction .

'(mx-rdf-owl2-someValuesFrom mx-rdf-range 'mx-rdfs-class) .

'(mx-rdf-owl2-sourceIndividual '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-sourceIndividual mx-rdf-domain '(mx-rdf-owl2-NegativePropertyAssertion .

'(mx-rdf-owl2-sourceIndividual mx-rdf-range '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-targetIndividual '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-targetIndividual mx-rdf-domain '(mx-rdf-owl2-NegativePropertyAssertion .

'(mx-rdf-owl2-targetIndividual mx-rdf-range '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-targetValue '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-targetValue mx-rdf-domain '(mx-rdf-owl2-NegativePropertyAssertion .

'(mx-rdf-owl2-targetValue mx-rdf-range mx-rdf-Literal .

'(mx-rdf-owl2-topDataProperty '((mx-rdf-type . '(mx-rdf-owl2-DatatypeProperty .

'(mx-rdf-owl2-topDataProperty mx-rdf-domain '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-topDataProperty mx-rdf-range mx-rdf-Literal .

'(mx-rdf-owl2-topObjectProperty '((mx-rdf-type . rdf:ObjectProperty .

'(mx-rdf-owl2-topObjectProperty mx-rdf-domain '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-topObjectProperty mx-rdf-range '(mx-rdf-owl2-Thing .

'(mx-rdf-owl2-unionOf '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-unionOf mx-rdf-domain 'mx-rdfs-class) .

'(mx-rdf-owl2-unionOf mx-rdf-range rdf:List .

'(mx-rdf-owl2-versionInfo '((mx-rdf-type . '(mx-rdf-owl2-AnnotationProperty .

'(mx-rdf-owl2-versionInfo mx-rdf-domain mx-rdfs-resource .

'(mx-rdf-owl2-versionInfo mx-rdf-range mx-rdfs-resource .

'(mx-rdf-owl2-versionIRI '((mx-rdf-type . '(mx-rdf-owl2-OntologyProperty .

'(mx-rdf-owl2-versionIRI mx-rdf-domain '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-versionIRI mx-rdf-range '(mx-rdf-owl2-Ontology .

'(mx-rdf-owl2-withRestrictions '((mx-rdf-type . rdf:Property .

'(mx-rdf-owl2-withRestrictions mx-rdf-domain mx-rdf-Datatype .

'(mx-rdf-owl2-withRestrictions mx-rdf-range rdf:List .
	

	








