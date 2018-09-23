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
#define INDENT_LEFT                         (11)      // indent from left (with allowance for border width)
#define INDENT_TOP                          (11)      // indent from top (with allowance for border width)
#define INDENT_RIGHT                        (11)      // indent from right (with allowance for border width)
#define INDENT_BOTTOM                       (11)      // indent from bottom (with allowance for border width)
#define CONTROLS_GAP_X                      (5)       // gap by X coordinate
#define CONTROLS_GAP_Y                      (5)       // gap by Y coordinate
//--- for buttons
#define BUTTON_WIDTH                        (90)     // size by X coordinate
#define BUTTON_HEIGHT                       (35)      // size by Y coordinate
//--- for the indication area
#define EDIT_HEIGHT                         (20)      // size by Y coordinate
//--- for group controls
#define GROUP_WIDTH                         (150)     // size by X coordinate
#define LIST_HEIGHT                         (179)     // size by Y coordinate
#define RADIO_HEIGHT                        (56)      // size by Y coordinate
#define CHECK_HEIGHT                        (93)      // size by Y coordinate

#define PANEL_WIDTH                         (220)      // width of panel
#define PANEL_HEIGHT                        (300)      // height of panel
#define LABEL_FONT_SIZE                     (8)      // height of panel

class BadRobotUI  : public BadRobotCore
{
	private:
		
	CEdit             m_edit;                         
   CButton           btnComprar;                       
   CButton           btnVender; 
   CButton           btnZerar; 
   CButton           btnInverter; 
   CLabel				label1;
   CLabel				label2;

   CButton           m_button3;                       // the fixed button object
   CSpinEdit         m_spin_edit;                     // the up-down object
   CDatePicker       m_date;                          // the datepicker object
   CListView         m_list_view;                     // the list object
   CComboBox         m_combo_box;                     // the dropdown list object
   CRadioGroup       m_radio_group;                   // the radio buttons group object
   CCheckGroup       m_check_group;                   // the check box group object
	
	bool CreateBtnComprar(void)
   {
      int x1=INDENT_LEFT;
      int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y);
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;

      if(!btnComprar.Create(m_chart_id,m_name+"BtnComprar",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnComprar.Text("Comprar"))
         return(false);
      if(!Add(btnComprar))
         return(false);         

      return(true);
    }
    
    
   bool CreateBtnVender(void)
   {
      int x1=INDENT_LEFT+(BUTTON_WIDTH+CONTROLS_GAP_X);
      int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y);
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnVender.Create(m_chart_id,m_name+"BtnVender",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnVender.Text("Vender"))
         return(false);
      if(!Add(btnVender))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnZerar(void)
   {
      int x1=INDENT_LEFT+(BUTTON_WIDTH+CONTROLS_GAP_X);
      int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y + BUTTON_HEIGHT + CONTROLS_GAP_Y);
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnZerar.Create(m_chart_id,m_name+"BtnZerar",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnZerar.Text("Zerar"))
         return(false);
      if(!Add(btnZerar))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnInverter(void)
   {
      int x1=INDENT_LEFT;
      int y1=INDENT_TOP+(EDIT_HEIGHT+CONTROLS_GAP_Y+ BUTTON_HEIGHT + CONTROLS_GAP_Y);
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnInverter.Create(m_chart_id,m_name+"BtnInverter",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnInverter.Text("Inverter"))
         return(false);
      if(!Add(btnInverter))
         return(false);
   
      return(true);
   }	 
   
	bool CreateLabel1(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y;
      int x2=INDENT_LEFT + 50;
      int y2=y1;
     
      if(!label1.Create(m_chart_id,m_name+"Label1",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label1.FontSize(8);
      label1.Text("VOLUME ATUAL 0");
      
      
      if(!Add(label1)) return(false); 
      
      

      return(true); 
   }
   
	bool CreateLabel2(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y * 2 + CONTROLS_GAP_Y + 3;
      int x2=x1 + INDENT_LEFT + 50;
      int y2=y1;
     
      if(!label2.Create(m_chart_id,m_name+"Label2",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label2.FontSize(8);
      label2.Text("SL 0 TP 0");      
      
      if(!Add(label2)) return(false); 
            
      return(true); 
   }       
	
	protected:
	
   EVENT_MAP_BEGIN(BadRobotUI)
      ON_EVENT(ON_CLICK,btnComprar,OnClickBtnComprar)
      ON_EVENT(ON_CLICK,btnVender,OnClickBtnVender)
      ON_EVENT(ON_CLICK,btnInverter,OnClickBtnInverter)
      ON_EVENT(ON_CLICK,btnZerar,OnClickBtnZerar)
      /*ON_EVENT(ON_CLICK,m_button3,OnClickButton3)
      ON_EVENT(ON_CHANGE,m_spin_edit,OnChangeSpinEdit)
      ON_EVENT(ON_CHANGE,m_date,OnChangeDate)
      ON_EVENT(ON_CHANGE,m_list_view,OnChangeListView)
      ON_EVENT(ON_CHANGE,m_combo_box,OnChangeComboBox)
      ON_EVENT(ON_CHANGE,m_radio_group,OnChangeRadioGroup)
      ON_EVENT(ON_CHANGE,m_check_group,OnChangeCheckGroup)*/
   EVENT_MAP_END(CAppDialog)
		
		
	public:
			
		BadRobotUI()
		{
         
		}			
		
		~BadRobotUI()
		{
		   CAppDialog::Destroy(0);
		}	
		
		bool LoadBase()
		{				
		   if(!CAppDialog::Create(0, GetRobotName() + " " + GetRobotVersion(), 0, 3, 50, PANEL_WIDTH, PANEL_HEIGHT))return(false);				   		   
		      
		   if(!CreateBtnComprar())return(false);
		   if(!CreateBtnVender())return(false);	  
		   if(!CreateBtnZerar())return(false);	  
		   if(!CreateBtnInverter())return(false);	
		   
		   if(!CreateLabel1())return(false);	
		   if(!CreateLabel2())return(false);	
		   
		   		   
		   BringToTop();
		   
		   btnComprar.ColorBackground(clrLightGreen);
		   btnComprar.Color(clrGreen);
		   btnComprar.FontSize(8);
		   
		   btnVender.ColorBackground(clrLightSalmon);
		   btnVender.Color(clrCrimson);
		   btnVender.FontSize(8);		  
		   
		   btnInverter.ColorBackground(clrLightSkyBlue);
		   btnInverter.Color(clrNavy);
		   btnInverter.FontSize(8);
		   
			btnZerar.ColorBackground(clrLightGoldenrod);
		   btnZerar.Color(clrSaddleBrown);
		   btnZerar.FontSize(8);
		  		   
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
      
      void ShowInfo()
      {            
         label1.Text("VOLUME ATUAL " + GetPositionVolumeText());
         label2.Text("SL " + DoubleToString(GetStopLoss(), _Digits) + " TP " + DoubleToString(GetStopGain(), _Digits));
      }	
	
};