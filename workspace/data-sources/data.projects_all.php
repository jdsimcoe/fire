<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceprojects_all extends SectionDatasource {

		public $dsParamROOTELEMENT = 'projects-all';
		public $dsParamConditionalizer = '(if any of ((if value of ({$pt1}) is (projects)), (if value of ({$pt1}) is (testimonials))) is (yes))';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';


		public $dsParamFILTERS = array(
				'144' => 'yes',
		);


		public $dsParamINCLUDEDELEMENTS = array(
				'short',
				'title',
				'content: formatted',
				'testimonials: name',
				'testimonials: content: formatted',
				'images: image',
				'images: caption',
				'city',
				'state'
		);


		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Projects: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://fire.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.4b1',
				'release-date' => '2014-03-17T21:42:30+00:00'
			);
		}

		public function getSource() {
			return '24';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
