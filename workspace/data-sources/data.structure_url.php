<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcestructure_url extends SectionDatasource {

		public $dsParamROOTELEMENT = 'structure-url';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '{$current-path:home}';
		public $dsParamPARAMOUTPUT = array(
				'system:id',
				'slug'
		);
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'132' => '{$current-path:home}',
				'127' => 'yes',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'slug',
				'path',
				'parent',
				'content: formatted',
				'tagline: formatted',
				'hero: image',
				'hero: caption'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Structure: URL',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://fire.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.3.6',
				'release-date' => '2014-03-01T00:47:38+00:00'
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
