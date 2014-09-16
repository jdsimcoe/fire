<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcereferences_all extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'references-all';
		public $dsParamConditionalizer = '(if value of ({$pt1}) is (references))';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'system:id';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '172' => 'yes',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'organization',
        'contact-name',
        'email',
        'website',
        'phone',
        'content: unformatted',
        'logo'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'logo' => array(
            'section_id' => '22',
            'field_id' => '156',
            'elements' => array(
                'caption',
                'image'
            )
        )
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'References: All',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://fire.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.0-rc.2',
            'release-date' => '2014-09-16T21:42:27+00:00'
        );
    }

    public function getSource()
    {
        return '26';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try{
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}