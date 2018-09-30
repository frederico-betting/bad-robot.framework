//+------------------------------------------------------------------+
//|                                   Copyright 2018, Erlon F. Souza |
//|                                       https://github.com/erlonfs |
//+------------------------------------------------------------------+

#property copyright "Copyright 2018, Erlon F. Souza"
#property link      "https://github.com/erlonfs"
#property version    "1.0"

#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Edit.mqh>
#include <Controls\Label.mqh>
#include <Controls\DatePicker.mqh>
#include <Controls\ListView.mqh>
#include <Controls\ComboBox.mqh>
#include <Controls\SpinEdit.mqh>
#include <Controls\RadioGroup.mqh>
#include <Controls\CheckGroup.mqh>

#include <BadRobot.Framework\Logger.mqh>
#include <BadRobot.Framework\BadRobotCore.mqh>

//--- indents and gaps
#define INDENT_LEFT                         	(11)      	// indent from left (with allowance for border width)
#define INDENT_TOP                          	(11)      	// indent from top (with allowance for border width)
#define INDENT_RIGHT                        	(11)      	// indent from right (with allowance for border width)
#define INDENT_BOTTOM                       	(11)      	// indent from bottom (with allowance for border width)
#define CONTROLS_GAP_X                      	(5)       	// gap by X coordinate
#define CONTROLS_GAP_Y                      	(5)       	// gap by Y coordinate
//--- for buttons
#define BUTTON_WIDTH                        	(90)     	// size by X coordinate
#define BUTTON_HEIGHT                       	(30)      	// size by Y coordinate
//--- for the indication area
#define EDIT_HEIGHT                         	(20)      	// size by Y coordinate
//--- for group controls
#define GROUP_WIDTH                         	(150)     	// size by X coordinate
#define LIST_HEIGHT                         	(179)     	// size by Y coordinate
#define RADIO_HEIGHT                        	(56)      	// size by Y coordinate
#define CHECK_HEIGHT                        	(93)      	// size by Y coordinate

#define PANEL_WIDTH                         	(220)      	// width of panel
#define PANEL_HEIGHT                        	(270)      	// height of panel
#define LABEL_FONT_SIZE                     	(8)			// height of panel
#define CONTROLS_DISTANCE_Y                 	(5)      	// height of panel
#define PANEL_FONT									("Tahoma")	//Font
#define PANEL_FONT_SIZE								(8)			//Font Size
#define PANEL_PARC_DISTANCE_X						(BUTTON_WIDTH / 10 * 6)			//Font Size
#define PANEL_PAD_DISTANCE_X						(BUTTON_WIDTH / 10 * 4)			//Font Size

class BadRobotUI  : public BadRobotCore
{
	private:
		
	CEdit             m_edit;                         
   CButton           btnComprar;                       
   CButton           btnVender; 
   CButton           btnZerar; 
   CButton           btnInverter; 
   CSpinEdit        	spinEditVolume;                     
   CButton           btnParcial1; 
   CButton           btnParcial2; 
   CButton           btnParcial3; 
   
   CButton           btnPad1; 
   CButton           btnPad2; 
   CButton           btnPad3; 
   CButton           btnPad4; 
   
   CButton           btnPad5; 
   CButton           btnPad6; 
   CButton           btnPad7; 
   CButton           btnPad8;    
	           
	bool CreateBtnComprar(void)
   {
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y;
      int x2=x1+BUTTON_WIDTH - BUTTON_WIDTH / 4;
      int y2=y1+BUTTON_HEIGHT;

      if(!btnComprar.Create(m_chart_id,m_name+"BtnComprar",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnComprar.Text("COMPRAR"))
         return(false);
      if(!Add(btnComprar))
         return(false);         

      return(true);
    }
    
   bool CreateSpinEditVolume(void)
   {
      int x1=INDENT_LEFT+((BUTTON_WIDTH / 4 * 3) + CONTROLS_GAP_X);
      int y1= CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y;
      int x2=x1+BUTTON_WIDTH / 2 - CONTROLS_DISTANCE_Y;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!spinEditVolume.Create(m_chart_id,m_name+"spinEditVolume",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!Add(spinEditVolume))
         return(false);
         
	   spinEditVolume.MinValue(1);
	   spinEditVolume.MaxValue(100);
	   spinEditVolume.Value((int)GetVolume());
	   spinEditVolume.Width(8);
   
      return(true);
   }    
    
    
   bool CreateBtnVender(void)
   {
      int x1=INDENT_LEFT+((BUTTON_WIDTH / 4 * 5) + CONTROLS_GAP_X);
      int y1= CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y;
      int x2=x1+BUTTON_WIDTH - BUTTON_WIDTH / 4;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnVender.Create(m_chart_id,m_name+"BtnVender",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnVender.Text("VENDER"))
         return(false);
      if(!Add(btnVender))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnZerar(void)
   {
      int x1=INDENT_LEFT+(BUTTON_WIDTH+CONTROLS_GAP_X);
      int y1=BUTTON_HEIGHT + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 2;
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnZerar.Create(m_chart_id,m_name+"BtnZerar",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnZerar.Text("ZERAR"))
         return(false);
      if(!Add(btnZerar))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnInverter(void)
   {
      int x1=INDENT_LEFT;
      int y1=BUTTON_HEIGHT + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 2;
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnInverter.Create(m_chart_id,m_name+"BtnInverter",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnInverter.Text("INVERTER"))
         return(false);
      if(!Add(btnInverter))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnParcial1(void)
   {
      int x1=INDENT_LEFT;
      int y1=(BUTTON_HEIGHT * 2) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 3 - 1;
      int x2=x1+PANEL_PARC_DISTANCE_X + CONTROLS_GAP_X;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnParcial1.Create(m_chart_id,m_name+"btnParcial1",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnParcial1.Text("1ª PARC."))
         return(false);
      if(!Add(btnParcial1))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnParcial2(void)
   {
      int x1=PANEL_PARC_DISTANCE_X + INDENT_LEFT + CONTROLS_GAP_X * 2 - 1;
      int y1=(BUTTON_HEIGHT * 2) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 3;
      int x2=x1+PANEL_PARC_DISTANCE_X + CONTROLS_GAP_X;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnParcial2.Create(m_chart_id,m_name+"btnParcial2",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnParcial2.Text("2ª PARC."))
         return(false);
      if(!Add(btnParcial2))
         return(false);
   
      return(true);
   }  
   
   bool CreateBtnParcial3(void)
   {
 		int x1=(PANEL_PARC_DISTANCE_X * 2) + INDENT_LEFT + CONTROLS_GAP_X * 4 - 1;
      int y1=(BUTTON_HEIGHT * 2) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 3;
      int x2=x1+PANEL_PARC_DISTANCE_X + CONTROLS_GAP_X;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnParcial3.Create(m_chart_id,m_name+"btnParcial3",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnParcial3.Text("3ª PARC."))
         return(false);
      if(!Add(btnParcial3))
         return(false);
   
      return(true);
   }
   
   bool DisableButton(CButton &btn)
   {
   	btn.Disable();
   	btn.ColorBackground(clrGray);
		btn.Color(clrDarkGray);
		btn.ColorBorder(clrGray);
		
		return true;
   }   
   
   bool EnableParcial(CButton &btn)
   {
   	btn.Enable();
   	btn.ColorBackground(clrDarkSlateGray);
		btn.Color(clrWhite);
		btn.ColorBorder(clrDarkSlateGray);
		
		return true;
		
   }  
   
   bool EnableZerar(CButton &btn)
   {
   	btn.Enable();
   	btn.ColorBackground(clrChocolate);
		btn.Color(clrWhite);
		btn.ColorBorder(clrChocolate);
						
		return true;
		
   }  
   
   bool EnableInverter(CButton &btn)
   {
   	btn.Enable();
   	btn.ColorBackground(clrMidnightBlue);
		btn.Color(clrWhite);
		btn.ColorBorder(clrMidnightBlue);
						
		return true;
		
   }     
   
   bool CreateBtnPad1(void)
   {
 		int x1=INDENT_LEFT;
      int y1=(BUTTON_HEIGHT * 3) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 4;
      int x2=x1+PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X + 1;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnPad1.Create(m_chart_id,m_name+"btnPad1",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnPad1.Text("+1"))
         return(false);
      if(!Add(btnPad1))
         return(false);
   
      return(true);
   } 
   
   bool CreateBtnPad2(void)
   {
 		int x1=INDENT_LEFT + PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X * 2;
      int y1=(BUTTON_HEIGHT * 3) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 4;
      int x2=x1+PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X + 1;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnPad2.Create(m_chart_id,m_name+"btnPad2",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnPad2.Text("+2"))
         return(false);
      if(!Add(btnPad2))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnPad3(void)
   {
 		int x1=INDENT_LEFT + PANEL_PAD_DISTANCE_X * 2 + CONTROLS_GAP_X * 4;
      int y1=(BUTTON_HEIGHT * 3) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 4;
      int x2=x1+PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X + 4;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnPad3.Create(m_chart_id,m_name+"btnPad3",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnPad3.Text("+5"))
         return(false);
      if(!Add(btnPad3))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnPad4(void)
   {
 		int x1=INDENT_LEFT + PANEL_PAD_DISTANCE_X * 3 + CONTROLS_GAP_X * 6 + 2;
      int y1=(BUTTON_HEIGHT * 3) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 4;
      int x2=x1+PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X + 5;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnPad4.Create(m_chart_id,m_name+"btnPad4",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnPad4.Text("+10"))
         return(false);
      if(!Add(btnPad4))
         return(false);
   
      return(true);
   }
            
   bool CreateBtnPad5(void)
   {
 		int x1=INDENT_LEFT;
      int y1=(BUTTON_HEIGHT * 4) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 5;
      int x2=x1+PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnPad5.Create(m_chart_id,m_name+"btnPad5",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnPad5.Text("-1"))
         return(false);
      if(!Add(btnPad5))
         return(false);
   
      return(true);
   }
   
	bool CreateBtnPad6(void)
   {
 		int x1=INDENT_LEFT + PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X * 2;
      int y1=(BUTTON_HEIGHT * 4) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 5;
      int x2=x1+PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X + 1;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnPad6.Create(m_chart_id,m_name+"btnPad6",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnPad6.Text("-2"))
         return(false);
      if(!Add(btnPad6))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnPad7(void)
   {
 		int x1=INDENT_LEFT + PANEL_PAD_DISTANCE_X * 2 + CONTROLS_GAP_X * 4;
      int y1=(BUTTON_HEIGHT * 4) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 5;
      int x2=x1+PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X + 4;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnPad7.Create(m_chart_id,m_name+"btnPad7",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnPad7.Text("-5"))
         return(false);
      if(!Add(btnPad7))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnPad8(void)
   {
 		int x1=INDENT_LEFT + PANEL_PAD_DISTANCE_X * 3 + CONTROLS_GAP_X * 6 + 2;
      int y1=(BUTTON_HEIGHT * 4) + CONTROLS_GAP_Y + CONTROLS_DISTANCE_Y * 5;
      int x2=x1+PANEL_PAD_DISTANCE_X + CONTROLS_GAP_X + 5;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnPad8.Create(m_chart_id,m_name+"btnPad8",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnPad8.Text("-10"))
         return(false);
      if(!Add(btnPad8))
         return(false);
   
      return(true);
   }            	               
	
	protected:
	
   EVENT_MAP_BEGIN(BadRobotUI)
      ON_EVENT(ON_CLICK,btnComprar,OnClickBtnComprar)
      ON_EVENT(ON_CLICK,btnVender,OnClickBtnVender)
      ON_EVENT(ON_CLICK,btnInverter,OnClickBtnInverter)
      ON_EVENT(ON_CLICK,btnZerar,OnClickBtnZerar)
      ON_EVENT(ON_CHANGE,spinEditVolume,OnChangeSpinEdit)
      ON_EVENT(ON_CLICK,btnParcial1,OnClickBtnParcial1)
      ON_EVENT(ON_CLICK,btnParcial2,OnClickBtnParcial2)
      ON_EVENT(ON_CLICK,btnParcial3,OnClickBtnParcial3)      
      ON_EVENT(ON_CLICK,btnPad1,OnClickBtnPad1)
      ON_EVENT(ON_CLICK,btnPad2,OnClickBtnPad2)
      ON_EVENT(ON_CLICK,btnPad3,OnClickBtnPad3)
      ON_EVENT(ON_CLICK,btnPad4,OnClickBtnPad4)
      ON_EVENT(ON_CLICK,btnPad5,OnClickBtnPad5)
      ON_EVENT(ON_CLICK,btnPad6,OnClickBtnPad6)
      ON_EVENT(ON_CLICK,btnPad7,OnClickBtnPad7)
      ON_EVENT(ON_CLICK,btnPad8,OnClickBtnPad8)
   EVENT_MAP_END(CAppDialog)
		
		
	public:
			
		BadRobotUI()
		{
         
		}			
		
		~BadRobotUI()
		{
		   CAppDialog::Destroy(_UninitReason);
		}	
		
		bool LoadBase()
		{
			if(_UninitReason == REASON_CHARTCHANGE)
			{
				return true;				
			}
			
			Comment("");
				
			CAppDialog::Destroy(_UninitReason);							
		   if(!CAppDialog::Create(0, GetRobotName() + " " + GetRobotVersion(), 0, 3, 50, PANEL_WIDTH, PANEL_HEIGHT))return(false);				   		   
		      
		   if(!CreateBtnComprar())return(false);
		   if(!CreateBtnVender())return(false);
		   
		   if(!CreateSpinEditVolume())return(false);
		   
		   if(!CreateBtnZerar())return(false);
		   if(!CreateBtnInverter())return(false);
		   
		   if(!CreateBtnParcial1())return(false);
		   if(!CreateBtnParcial2())return(false);
		   if(!CreateBtnParcial3())return(false);
		   
		   if(!CreateBtnPad1())return(false);
		   if(!CreateBtnPad2())return(false);
		   if(!CreateBtnPad3())return(false);
		   if(!CreateBtnPad4())return(false);
		   
		   if(!CreateBtnPad5())return(false);
		   if(!CreateBtnPad6())return(false);
		   if(!CreateBtnPad7())return(false);
		   if(!CreateBtnPad8())return(false);
		   		   		   		   
		   BringToTop();
		   
		  	btnComprar.ColorBackground(clrDarkGreen);
		   btnComprar.Color(clrWhite);
		   btnComprar.Font(PANEL_FONT);
		   btnComprar.FontSize(PANEL_FONT_SIZE);
		   btnComprar.ColorBorder(clrDarkGreen);
		   
		   btnVender.ColorBackground(clrFireBrick);
		   btnVender.Color(clrWhite);
		   btnVender.Font(PANEL_FONT);
		   btnVender.FontSize(PANEL_FONT_SIZE);
		   btnVender.ColorBorder(clrFireBrick);		  
		   
		   btnInverter.ColorBackground(clrMidnightBlue);
		   btnInverter.Color(clrWhite);
		   btnInverter.Font(PANEL_FONT);
		   btnInverter.FontSize(PANEL_FONT_SIZE);
		   btnInverter.ColorBorder(clrMidnightBlue);
		   
			btnZerar.ColorBackground(clrChocolate);
		   btnZerar.Color(clrWhite);
		   btnZerar.Font(PANEL_FONT);
		   btnZerar.FontSize(PANEL_FONT_SIZE);
		   btnZerar.ColorBorder(clrChocolate);
		   
		   btnParcial1.ColorBackground(clrDarkSlateGray);
		   btnParcial1.Color(clrWhite);
		   btnParcial1.Font(PANEL_FONT);
		   btnParcial1.FontSize(PANEL_FONT_SIZE);
		   btnParcial1.ColorBorder(clrDarkSlateGray);
		   
		   btnParcial2.ColorBackground(clrDarkSlateGray);
		   btnParcial2.Color(clrWhite);
		   btnParcial2.Font(PANEL_FONT);
		   btnParcial2.FontSize(PANEL_FONT_SIZE);
		   btnParcial2.ColorBorder(clrDarkSlateGray);
		   
		   btnParcial3.ColorBackground(clrDarkSlateGray);
		   btnParcial3.Color(clrWhite);
		   btnParcial3.Font(PANEL_FONT);
		   btnParcial3.FontSize(PANEL_FONT_SIZE);	
		   btnParcial3.ColorBorder(clrDarkSlateGray);	
		   
		  	btnPad1.ColorBackground(clrWhite);
		   btnPad1.Color(clrDarkGreen);
		   btnPad1.Font(PANEL_FONT);
		   btnPad1.FontSize(PANEL_FONT_SIZE);
		   btnPad1.ColorBorder(clrDarkGreen);
		   
		  	btnPad2.ColorBackground(clrWhite);
		   btnPad2.Color(clrDarkGreen);
		   btnPad2.Font(PANEL_FONT);
		   btnPad2.FontSize(PANEL_FONT_SIZE);
		   btnPad2.ColorBorder(clrDarkGreen);
		  		   
		  	btnPad3.ColorBackground(clrWhite);
		   btnPad3.Color(clrDarkGreen);
		   btnPad3.Font(PANEL_FONT);
		   btnPad3.FontSize(PANEL_FONT_SIZE);
		   btnPad3.ColorBorder(clrDarkGreen);

		  	btnPad4.ColorBackground(clrWhite);
		   btnPad4.Color(clrDarkGreen);
		   btnPad4.Font(PANEL_FONT);
		   btnPad4.FontSize(PANEL_FONT_SIZE);
		   btnPad4.ColorBorder(clrDarkGreen);
		   
		   btnPad5.ColorBackground(clrWhite);
		   btnPad5.Color(clrFireBrick);
		   btnPad5.Font(PANEL_FONT);
		   btnPad5.FontSize(PANEL_FONT_SIZE);
		   btnPad5.ColorBorder(clrFireBrick);
		   
		  	btnPad6.ColorBackground(clrWhite);
		   btnPad6.Color(clrFireBrick);
		   btnPad6.Font(PANEL_FONT);
		   btnPad6.FontSize(PANEL_FONT_SIZE);
		   btnPad6.ColorBorder(clrFireBrick);
		  		   
		  	btnPad7.ColorBackground(clrWhite);
		   btnPad7.Color(clrFireBrick);
		   btnPad7.Font(PANEL_FONT);
		   btnPad7.FontSize(PANEL_FONT_SIZE);
		   btnPad7.ColorBorder(clrFireBrick);

		  	btnPad8.ColorBackground(clrWhite);
		   btnPad8.Color(clrFireBrick);
		   btnPad8.Font(PANEL_FONT);
		   btnPad8.FontSize(PANEL_FONT_SIZE);
		   btnPad8.ColorBorder(clrFireBrick);
		   
		   ManageButtonStatus();
		  		   
		   CAppDialog::Run();		   
		   
         return (true);
		}
		
		void OnClickBtnComprar()
      {         
         BadRobotCore::Buy();         
      }
		
		void OnClickBtnVender()
      {         
         BadRobotCore::Sell();         
      }	
      
		void OnClickBtnInverter()
      {         
         BadRobotCore::InvertPosition();         
      }	
      
		void OnClickBtnZerar()
      {         
         BadRobotCore::ClosePosition();         
      }	
      
		void OnClickBtnParcial1()
      {         
			ExecutePrimeiraParcial();
      }	      
      
		void OnClickBtnParcial2()
      {         
         ExecuteSegundaParcial();
      }
      
		void OnClickBtnParcial3()
      {         
         ExecuteTerceiraParcial();
      }            
      
		void OnChangeSpinEdit()
		{
		   SetVolume(spinEditVolume.Value());		   
		   printf(DoubleToString(GetVolume(), _Digits));
		} 
		
		void OnClickBtnPad1()
      {         
       	Buy(0.0, GetSymbolVolumeSize());
      }	
      
		void OnClickBtnPad2()
      {         
         Buy(0.0, GetSymbolVolumeSize() * 2);
      }
      
		void OnClickBtnPad3()
      {         
  			Buy(0.0, GetSymbolVolumeSize() * 5);              
      }
      
		void OnClickBtnPad4()
      {         
         Buy(0.0, GetSymbolVolumeSize() * 10);    
      } 
      
		void OnClickBtnPad5()
      {         
      	Sell(0.0, GetSymbolVolumeSize());
      }	
      
		void OnClickBtnPad6()
      {         
      	Sell(0.0, GetSymbolVolumeSize() * 2);                
      }
      
		void OnClickBtnPad7()
      {         
      	Sell(0.0, GetSymbolVolumeSize() * 5);                
      }
      
		void OnClickBtnPad8()
      {         
      	Sell(0.0, GetSymbolVolumeSize() * 10);                
      }                       		                 
      
      void ShowInfo()
      {           
      	if(!IsRewrite()) return;   
      	
      	ManageButtonStatus();
      		      	 
      } 
      
      bool ManageButtonStatus()
      {
      	bool execute = true;
      	
      	execute &= !HasPositionOpen() || !IsParcial() || GetPrimeiraParcialVolume() <= 0 || IsPrimeiraParcial() ? DisableButton(&btnParcial1) : EnableParcial(&btnParcial1);      	
      	execute &= !HasPositionOpen() || !IsParcial() || GetSegundaParcialVolume() <= 0 || IsSegundaParcial() ?  DisableButton(&btnParcial2) : EnableParcial(&btnParcial2);      	
      	execute &= !HasPositionOpen() || !IsParcial() || GetTerceiraParcialVolume() <= 0 || IsTerceiraParcial() ? DisableButton(&btnParcial3) : EnableParcial(&btnParcial3);      	
 			execute &= !HasPositionOpen() ? DisableButton(&btnZerar) : EnableZerar(&btnZerar);	
 			execute &= !HasPositionOpen() ? DisableButton(&btnInverter) : EnableInverter(&btnInverter);
 			
 			return execute;
 			
      };     	
};