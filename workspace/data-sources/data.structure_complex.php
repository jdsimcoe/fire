<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcestructure_complex extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'structure-complex';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '1';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamREQUIREDPARAM = '$pt1:home';
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'yes';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '124' => '{$pt1:home}',
        '127' => 'yes',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'path',
        'title',
        'slug',
        'parent',
        'content: formatted',
        'tagline: formatted'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'parent' => array(
            'section_id' => '21',
            'field_id' => '132',
            'elements' => array(
                'path',
                'title',
                'slug'
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
            'name' => 'Structure: Complex',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://fire.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.1',
            'release-date' => '2014-09-22T23:48:49+00:00'
        );
    }

    public function getSource()
    {
        return '21';
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