<%@ Page language="c#" Codebehind="Bar.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Bar1" %>
<%@ Register TagPrefix="cc1" Namespace="C1.Web.C1WebChart" Assembly="C1.Web.C1WebChart" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>Bar</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
  </HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<cc1:c1webchart id="C1WebChart1" runat="server" Width="666px" Height="288px" ImageFormat="Png" SlidingExpiration="00:10:00"
				ImageRenderMethod="BinaryWrite" ImageTransferMethod="None">
				<Serializer Value="&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;Chart2DPropBag Version=&quot;1.0.20071.17032&quot;&gt;
  &lt;StyleCollection&gt;
    &lt;NamedStyle Name=&quot;Area.default&quot; ParentName=&quot;Control&quot; StyleData=&quot;Border=None,Transparent,1;AlignVert=Top;&quot; /&gt;
    &lt;NamedStyle Name=&quot;Control&quot; ParentName=&quot;Control.default&quot; StyleData=&quot;Border=Solid,ControlDark,1;BackColor=White;&quot; /&gt;
    &lt;NamedStyle Name=&quot;AxisY2&quot; ParentName=&quot;Area&quot; StyleData=&quot;Rotation=Rotate90;AlignHorz=Far;AlignVert=Center;&quot; /&gt;
    &lt;NamedStyle Name=&quot;Footer&quot; ParentName=&quot;Control&quot; StyleData=&quot;Border=None,Transparent,1;&quot; /&gt;
    &lt;NamedStyle Name=&quot;Header&quot; ParentName=&quot;Control&quot; StyleData=&quot;Border=None,Transparent,1;&quot; /&gt;
    &lt;NamedStyle Name=&quot;Legend&quot; ParentName=&quot;Legend.default&quot; StyleData=&quot;AlignHorz=Center;AlignVert=Top;&quot; /&gt;
    &lt;NamedStyle Name=&quot;Area&quot; ParentName=&quot;Area.default&quot; StyleData=&quot;Border=Solid,ControlDark,1;Rounding=10 10 10 10;&quot; /&gt;
    &lt;NamedStyle Name=&quot;LabelStyleDefault&quot; ParentName=&quot;LabelStyleDefault.default&quot; /&gt;
    &lt;NamedStyle Name=&quot;LabelStyleDefault.default&quot; ParentName=&quot;Control&quot; StyleData=&quot;Border=None,Transparent,1;BackColor=Transparent;&quot; /&gt;
    &lt;NamedStyle Name=&quot;PlotArea&quot; ParentName=&quot;Area&quot; StyleData=&quot;Border=None,Transparent,1;&quot; /&gt;
    &lt;NamedStyle Name=&quot;Control.default&quot; ParentName=&quot;&quot; StyleData=&quot;ForeColor=ControlText;Border=None,Transparent,1;BackColor=Control;&quot; /&gt;
    &lt;NamedStyle Name=&quot;Legend.default&quot; ParentName=&quot;Control&quot; StyleData=&quot;Border=None,Transparent,1;Wrap=False;AlignVert=Top;&quot; /&gt;
    &lt;NamedStyle Name=&quot;AxisY&quot; ParentName=&quot;Area&quot; StyleData=&quot;ForeColor=ControlDarkDark;AlignHorz=Near;Rotation=Rotate270;AlignVert=Center;&quot; /&gt;
    &lt;NamedStyle Name=&quot;AxisX&quot; ParentName=&quot;Area&quot; StyleData=&quot;ForeColor=ControlDarkDark;AlignHorz=Center;Rotation=Rotate0;AlignVert=Bottom;&quot; /&gt;
  &lt;/StyleCollection&gt;
  &lt;ChartGroupsCollection&gt;
    &lt;ChartGroup Name=&quot;Group1&quot; ChartType=&quot;Bar&quot;&gt;
      &lt;DataSerializer DefaultSet=&quot;True&quot;&gt;
        &lt;DataSeriesCollection&gt;
          &lt;DataSeriesSerializer&gt;
            &lt;LineStyle Color=&quot;LightPink&quot; /&gt;
            &lt;SymbolStyle Color=&quot;LightPink&quot; OutlineColor=&quot;DeepPink&quot; Shape=&quot;Box&quot; /&gt;
            &lt;SeriesLabel&gt;series 0&lt;/SeriesLabel&gt;
            &lt;X&gt;1;2;3;4;5&lt;/X&gt;
            &lt;Y&gt;20;22;19;24;25&lt;/Y&gt;
            &lt;DataTypes&gt;Single;Single;Double;Double;Double&lt;/DataTypes&gt;
          &lt;/DataSeriesSerializer&gt;
          &lt;DataSeriesSerializer&gt;
            &lt;LineStyle Color=&quot;LightBlue&quot; /&gt;
            &lt;SymbolStyle Color=&quot;LightBlue&quot; OutlineColor=&quot;DarkBlue&quot; Shape=&quot;Dot&quot; /&gt;
            &lt;SeriesLabel&gt;series 1&lt;/SeriesLabel&gt;
            &lt;X&gt;1;2;3;4;5&lt;/X&gt;
            &lt;Y&gt;8;12;10;12;15&lt;/Y&gt;
            &lt;DataTypes&gt;Single;Single;Double;Double;Double&lt;/DataTypes&gt;
          &lt;/DataSeriesSerializer&gt;
          &lt;DataSeriesSerializer&gt;
            &lt;LineStyle Color=&quot;LightGreen&quot; /&gt;
            &lt;SymbolStyle Color=&quot;LightGreen&quot; OutlineColor=&quot;DarkGreen&quot; Shape=&quot;Tri&quot; /&gt;
            &lt;SeriesLabel&gt;series 2&lt;/SeriesLabel&gt;
            &lt;X&gt;1;2;3;4;5&lt;/X&gt;
            &lt;Y&gt;10;16;17;15;23&lt;/Y&gt;
            &lt;DataTypes&gt;Single;Single;Double;Double;Double&lt;/DataTypes&gt;
          &lt;/DataSeriesSerializer&gt;
          &lt;DataSeriesSerializer&gt;
            &lt;LineStyle Color=&quot;Orchid&quot; /&gt;
            &lt;SymbolStyle Color=&quot;Orchid&quot; OutlineColor=&quot;DarkOrchid&quot; Shape=&quot;Diamond&quot; /&gt;
            &lt;SeriesLabel&gt;series 3&lt;/SeriesLabel&gt;
            &lt;X&gt;1;2;3;4;5&lt;/X&gt;
            &lt;Y&gt;16;19;15;22;18&lt;/Y&gt;
            &lt;DataTypes&gt;Single;Single;Double;Double;Double&lt;/DataTypes&gt;
          &lt;/DataSeriesSerializer&gt;
        &lt;/DataSeriesCollection&gt;
      &lt;/DataSerializer&gt;
    &lt;/ChartGroup&gt;
    &lt;ChartGroup Name=&quot;Group2&quot; ChartType=&quot;Bar&quot;&gt;
      &lt;DataSerializer /&gt;
    &lt;/ChartGroup&gt;
  &lt;/ChartGroupsCollection&gt;
  &lt;Header Compass=&quot;North&quot; Visible=&quot;False&quot; /&gt;
  &lt;Footer Compass=&quot;South&quot; Visible=&quot;False&quot; /&gt;
  &lt;Legend Compass=&quot;East&quot; Visible=&quot;True&quot; /&gt;
  &lt;ChartArea /&gt;
  &lt;Axes&gt;
    &lt;Axis Max=&quot;5.5&quot; Min=&quot;0.5&quot; UnitMajor=&quot;1&quot; UnitMinor=&quot;0.5&quot; AutoMajor=&quot;True&quot; AutoMinor=&quot;True&quot; AutoMax=&quot;True&quot; AutoMin=&quot;True&quot; Compass=&quot;South&quot;&gt;
      &lt;Text&gt;周次&lt;/Text&gt;
      &lt;GridMajor Visible=&quot;True&quot; Spacing=&quot;1&quot; /&gt;
    &lt;/Axis&gt;
    &lt;Axis Max=&quot;25&quot; Min=&quot;5&quot; UnitMajor=&quot;5&quot; UnitMinor=&quot;2.5&quot; AutoMajor=&quot;True&quot; AutoMinor=&quot;True&quot; AutoMax=&quot;True&quot; AutoMin=&quot;True&quot; Compass=&quot;West&quot;&gt;
      &lt;Text&gt;周次/小時&lt;/Text&gt;
      &lt;GridMajor Visible=&quot;True&quot; Spacing=&quot;5&quot; /&gt;
    &lt;/Axis&gt;
    &lt;Axis Max=&quot;0&quot; Min=&quot;0&quot; UnitMajor=&quot;0&quot; UnitMinor=&quot;0&quot; AutoMajor=&quot;True&quot; AutoMinor=&quot;True&quot; AutoMax=&quot;True&quot; AutoMin=&quot;True&quot; Compass=&quot;East&quot; /&gt;
  &lt;/Axes&gt;
&lt;/Chart2DPropBag&gt;"></Serializer>
			</cc1:c1webchart>
		</form>
	</body>
</HTML>
