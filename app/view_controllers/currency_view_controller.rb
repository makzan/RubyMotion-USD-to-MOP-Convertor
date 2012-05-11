class CurrencyViewController < UIViewController 
  def loadView
    self.view = UIView.alloc.init
  end
  
  def viewWillAppear(animated)
    super
    
    view.backgroundColor = UIColor.grayColor
    
    usdLabel = UILabel.new
    usdLabel.text = 'Fill in USD and convert to MOP'
    usdLabel.textColor = UIColor.whiteColor
    usdLabel.backgroundColor = UIColor.clearColor
    usdLabel.frame = [[20, 70], [280, 40]] # and don't forget to set the position
    view.addSubview usdLabel
    
    @field = UITextField.new
    @field.borderStyle = UITextBorderStyleRoundedRect
    @field.placeholder = "USD $10,000"
    @field.keyboardType = UIKeyboardTypeNumbersAndPunctuation
    @field.returnKeyType = UIReturnKeyDone
    @field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    @field.delegate = self
    @field.frame = [[20, 120], [280, 50]]
    view.addSubview @field
    
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.setTitle 'Convert to MOP', forState:UIControlStateNormal
    button.addTarget self, action:'tappedButton', forControlEvents:UIControlEventTouchUpInside
    button.frame = [[20, 180], [280, 60]]
    view.addSubview button
    
    @resultLabel = UILabel.new
    @resultLabel.textColor = UIColor.whiteColor
    @resultLabel.backgroundColor = UIColor.clearColor
    @resultLabel.frame = [[20, 300], [280, 50]]
    view.addSubview @resultLabel
    
    # we have only one purpose in this app, that's the inputting a number in textfield.
    # so let's focus it.
    @field.becomeFirstResponder
    
    NSLog "Ruby Rocks"
  end
  
  def convert
    @field.resignFirstResponder
    
    usd = @field.text.to_f
    mop = usd * 7.8
    @resultLabel.text = "USD #{'%.2f' % usd} = MOP #{'%.2f' % mop}"
  end
  
  def tappedButton
    convert
  end
  
  # UITextField delegate
  def textFieldShouldReturn(textfield)    
    convert
  end
end