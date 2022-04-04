<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class captcha extends CI_Controller {

    public static $BackgroundColor = "FFFFFF"; // Hex string
	public static $TextColor = "003359"; // Hex string
	public static $NoiseColor = "64A0C8"; // Hex string
	public static $Width = 200;
	public static $Height = 50;
	public static $Characters = 4;
	public static $FontSize = 0;
	public static $ImageType = IMG_PNG;
	public static $Font = "<#= captchaFont #>";
	public $Response = "";

    function index(){
        $this->form_validation->set_rules('captcha','Captcha','trim|callback_check_captcha|required');
        if($this->form_validation->run() == false){
            $this->load->view('captcha/index',array('img'=>$this->create_captcha));
        }else{
            echo 'Succes Captcha Code';
        }
    }

    function check_captcha(){
        if($this->input->post('captcha') == $this->session->userdata('captchaword')){
            return true;
        }else{
            $this->form_validation->set_message('Pastikan nilai hasil perhitungan diisi dengan benar');
            return false;
        }
    }

	/**
	 * Constructor
	 *
	 * @param string $Font Font file name
	 */
	public function __construct()
	{
		if (self::$FontSize <= 0)
			self::$FontSize = self::$Height * 0.55;
	}

	/**
	 * Generate code
	 *
	 * @param integer $Characters Number of characters
	 * @return string
	 */
	protected function generateCode($Characters)
	{
		$possible = "23456789BCDFGHJKMNPQRSTVWXYZ"; // Possible characters
		$code = "";
		$i = 0;
		while ($i < $Characters) {
			$code .= substr($possible, mt_rand(0, strlen($possible) - 1), 1);
			$i++;
		}
		return $code;
	}

	/**
	 * Convert hex to RGB
	 *
	 * @param string $hexstr Hex string
	 * @return array Array of RGB
	 */
	protected function hexToRGB($hexstr)
	{
		$int = hexdec($hexstr);
		return [
			"R" => 0xFF & ($int >> 0x10),
			"G" => 0xFF & ($int >> 0x8),
			"B" => 0xFF & $int
		];
	}

	/**
	 * Output image
	 *
	 * @return string Code
	 */
	public function show()
	{
		$operasi = $this->generateOperating(1);
		
		if($operasi == 1){
		  $angka1 = $this->generateRandomString(2);
		  $angka2 = $this->generateRandomString(1);
		  $hasil = (INT)($angka1) + (INT)($angka2);
		  $randomString = $angka1." + ".$angka2." = ? ";
		}
		elseif($operasi == 2){
		  $angka1 = $this->generateRandomString(2);
		  $angka2 = $this->generateRandomString(1);
		  $hasil = (INT)($angka1) - (INT)($angka2);
		  $randomString = $angka1." - ".$angka2." = ? ";
		}
		elseif($operasi == 3){
		  $angka1 = $this->generateRandomString(1);
		  $angka2 = $this->generateRandomString(1);
		  $hasil = (INT)($angka1) * (INT)($angka2);
		  $randomString = $angka1." x ".$angka2." = ? ";
		}
		//$code = $this->generateCode(self::$Characters);
		$code = $randomString;
		$oriCode = $code;
		
		$code = trim($code);
		$image = imagecreate(self::$Width, self::$Height) or die("Cannot initialize new GD image stream");
		$rgb = $this->hexToRGB(self::$BackgroundColor);
		$backgroundColor = imagecolorallocate($image, $rgb["R"], $rgb["G"], $rgb["B"]);
		$rgb = $this->hexToRGB(self::$TextColor);
		$textColor = imagecolorallocate($image, $rgb["R"], $rgb["G"], $rgb["B"]);
		$rgb = $this->hexToRGB(self::$NoiseColor);
		$noiseColor = imagecolorallocate($image, $rgb["R"], $rgb["G"], $rgb["B"]);
		// Generate random dots in background
		for ($i = 0; $i < (self::$Width * self::$Height)/3; $i++)
			imagefilledellipse($image, mt_rand(0, self::$Width), mt_rand(0, self::$Height), 1, 1, $noiseColor);
		// Generate random lines in background
		for ($i = 0; $i < (self::$Width * self::$Height)/150; $i++)
			imageline($image, mt_rand(0, self::$Width), mt_rand(0, self::$Height), mt_rand(0, self::$Width), mt_rand(0, self::$Height), $noiseColor);
		$fontFile = self::$Font;
		// Always use full path
		if (!ContainsString($fontFile, "."))
			$fontFile .= ".ttf";
		$fontFile = IncludeTrailingDelimiter(Config("FONT_PATH"), TRUE) . $fontFile;
		// Create textbox and add text
		$textBox = imagettfbbox(self::$FontSize, 0, $fontFile, $code) or die("Error in imagettfbbox function");
		$x = (self::$Width - $textBox[4])/2;
		$y = (self::$Height - ($textBox[5] - $textBox[3]))/2;
		imagettftext($image, self::$FontSize, 0, $x, $y, $textColor, $fontFile , $code) or die("Error in imagettftext function");
		// Output captcha image to browser
		switch (self::$ImageType) {
			case IMG_JPG:
				AddHeader("Content-Type", "image/jpeg");
				imagejpeg($image, null, 90);
				break;
			case IMG_GIF:
				AddHeader("Content-Type", "image/gif");
				imagegif($image);
				break;
			default: // PNG
				AddHeader("Content-Type", "image/png");
				imagepng($image);
				break;
		}
		imagedestroy($image);
		return $hasil;
	}

	// HTML tag
	public function getHtml() {
		global $Language, $Page;
		$classAttr = ($Page->OffsetColumnClass) ? ' class="' . $Page->OffsetColumnClass . '"' : "";
		return <<<EOT
<div class="form-group row ew-captcha">
	<div{$classAttr}>
		<p><img src="<#= GetFileName("ewcaptcha.php") #>" alt="" class="ew-captcha-image"></p>
		<input type="text" name="captcha" id="captcha" class="form-control ew-control" size="30" placeholder="{$Language->phrase("EnterValidateCode")}">
	</div>
</div>
EOT;
	}

	// HTML tag for confirm page
	public function getConfirmHtml() {
		return '<input type="hidden" name="captcha" id="captcha" value="' . HtmlEncode($this->Response) . '">';
	}

	// Validate
	public function validate() {
		return ($this->Response == @$_SESSION[SESSION_CAPTCHA_CODE]);
	}

	// Client side validation script
	public function getScript() {
		return <<<EOT
		if (fobj.captcha && !ew.hasValue(fobj.captcha))
			return this.onError(fobj.captcha, ew.language.phrase("EnterValidateCode"));
EOT;
	}
protected function generateOperating($length = 9) {
		$characters = '321';
		$randomOperating = '';
		for ($i = 0; $i < $length; $i++) {
			$randomOperating .= $characters[rand(0, strlen($characters) - 1)];
		}
		return $randomOperating;
	}

	protected function generateRandomString($length = 9) {
		$characters = '123456789';
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, strlen($characters) - 1)];
		}
		return $randomString;
	}
	
}