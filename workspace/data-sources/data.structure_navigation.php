<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcestructure_navigation extends SectionDatasource {

		public $dsParamROOTELEMENT = 'structure-navigation';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';
		

		public $dsParamFILTERS = array(
				'127' => 'yes',
				'135' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'slug',
				'path',
				'parent'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Structure: Navigation',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://fire.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.3.6',
				'release-date' => '2014-02-28T23:07:57+00:00'
			);
		}

		public function getSource() {
			return '21';
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
