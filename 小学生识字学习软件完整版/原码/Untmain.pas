unit Untmain;
interface
uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActnList, Buttons, Menus,Spin,MMSystem, jpeg;
type
  TFrmmain = class(TForm)
    pnl1: TPanel;
    rg1: TRadioGroup;
    pnl2: TPanel;
    pnl3: TPanel;
    grp1: TGroupBox;
    cbb1: TComboBox;
    rg2: TRadioGroup;
    lbl2: TLabel;
    actlst1: TActionList;
    actman: TAction;
    actauto: TAction;
    tmr1: TTimer;
    dlgFontLBL: TFontDialog;
    img1: TImage;
    lbl1: TLabel;
    btn2: TSpeedButton;
    btn1: TSpeedButton;
    grp2: TGroupBox;
    se1: TSpinEdit;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pb1: TPaintBox;
    pb2: TPaintBox;
    img2: TImage;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbb1Change(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure rg2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure lbl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure se1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
   
    function showword:string;
    procedure Showword_lbl;
    { Private declarations }
  public
    wordfilename:string;
    strslist,wordlist:TStringList;
    wordrec:Integer;
    { Public declarations }
    procedure file_tostrslist;
  end;

var
  Frmmain: TFrmmain;
  yesbmp,nobmp:TBitmap ;
  rightsound,wrongsound:pchar;
  hRes:THandle ;
implementation
   uses Untfun,UntInput ;
{$R *.dfm}
{$R WINDOWSXP.RES}
{$R MYRES.res}
procedure TFrmmain.FormCreate(Sender: TObject);
var
  stream:TStream ;
  S:string ;
  hResInfo : THandle;
begin
  yesbmp :=TBitmap.Create ;
  nobmp :=TBitmap.Create ;
  Stream:=TResourceStream.Create(HINSTANCE,'yes','bmp');
  yesbmp.LoadFromStream(Stream);
  stream:=TResourceStream.Create(HInstance,'no','bmp');
  nobmp.LoadFromStream(stream);
  Stream.Free ;
  hResInfo := FindResource(HInstance, 'right', 'WAVE');
  hRes := LoadResource(HInstance,hResInfo);
  if hRes > 32 then {its a good load}
  begin {lock the resource}
  rightSound:=LockResource(hRes);
  end;
  hResInfo := FindResource(HInstance, 'wrong', 'WAVE');
  hRes := LoadResource(HInstance,hResInfo);
  if hRes > 32 then {its a good load}
  begin {lock the resource}
  wrongSound:=LockResource(hRes);
  end;
  S:=getAppPath+'shaoershizi.txt';
  if FileExists(S) then
  wordfilename:=S
  else
  wordfilename:=PathGetWindowsPath +'shaoershizi.txt' ;
  wordlist:=TStringList.Create ;
  strslist:=TStringList.Create ;
  file_tostrslist;
  if cbb1.Items.Count>0 then
  begin
    cbb1.ItemIndex:=0;
    TxttoWords(strslist.Strings[0],wordlist);
    wordrec:=0;
  end;
end;

procedure TFrmmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  wordlist.Free ;
  strslist.Free ;
  yesbmp.Free ;
  nobmp.Free;
end;

procedure TFrmmain.cbb1Change(Sender: TObject);
var
  s:string;
begin
  s:=strslist.Strings[cbb1.ItemIndex];
  wordlist.Clear ;
  TxttoWords(s,wordlist);
  wordrec:=0;
end;

procedure TFrmmain.file_tostrslist;
var
  temlist:TStringList ;
  temstr,str1,str2:string;
  i,j:Integer;
begin
  temlist:=TStringList.Create ;
  cbb1.Items.Clear ;
  strslist.Clear ;
  if FileExists(wordfilename) then
  begin
    temlist.LoadFromFile(wordfilename);
    str1:= '�����ֿ�';
    str2:='�������������������������������������������������������������������°ðİŰưǰȰɰʰ˰̰ͰΰϰаѰҰӰ԰հְװذٰڰ۰ܰݰް߰����������������������������������������������������������������������������������������������';
    str2:=str2+'���������������±ñıűƱǱȱɱʱ˱̱ͱαϱбѱұӱԱձֱױرٱڱ۱ܱݱޱ߱�������������������������������������������������������������������������������������������������������������²òĲŲƲǲȲɲʲ˲̲ͲβϲвѲҲӲԲղֲײ�';
    str2:=str2+'�ٲڲ۲ܲݲ޲߲�������������������������������������������������������������������������������������������������������������³óĳųƳǳȳɳʳ˳̳ͳγϳгѳҳӳԳճֳ׳سٳڳ۳ܳݳ޳߳��������������������������';
    str2:=str2+'�����������������������������������������������������������������������������������´ôĴŴƴǴȴɴʴ˴̴ʹδϴдѴҴӴԴմִ״شٴڴ۴ܴݴ޴ߴ��������������������������������������������������������������������������������������';
    str2:=str2+'�����������������������µõĵŵƵǵȵɵʵ˵̵͵εϵеѵҵӵԵյֵ׵صٵڵ۵ܵݵ޵ߵ�������������������������������������������������������������������������������������������������������������¶öĶŶƶǶȶɶʶ˶̶Ͷζ϶жѶҶӶ�';
    str2:=str2+'�նֶ׶ضٶڶ۶ܶݶ޶߶�������������������������������������������������������������������������������������������������������������·÷ķŷƷǷȷɷʷ˷̷ͷηϷзѷҷӷԷշַ׷طٷڷ۷ܷݷ޷߷��������������������';
    str2:=str2+'������������������������������������������������������������������������������������������¸øĸŸƸǸȸɸʸ˸̸͸θϸиѸҸӸԸոָ׸ظٸڸ۸ܸݸ޸߸������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������¹ùĹŹƹǹȹɹʹ˹̹͹ιϹйѹҹӹԹչֹ׹عٹڹ۹ܹݹ޹߹�������������������������������������������������������������������������������������������������������������ºúĺźƺǺȺɺʺ˺̺ͺκϺ�';
    str2:=str2+'�ѺҺӺԺպֺ׺غٺںۺܺݺ޺ߺ�������������������������������������������������������������������������������������������������������������»ûĻŻƻǻȻɻʻ˻̻ͻλϻлѻһӻԻջֻ׻ػٻڻۻܻݻ޻߻����������������';
    str2:=str2+'����������������������������������������������������������������������������������������������¼üļżƼǼȼɼʼ˼̼ͼμϼмѼҼӼԼռּ׼ؼټڼۼܼݼ޼߼����������������������������������������������������������������������';
    str2:=str2+'���������������������������������������½ýĽŽƽǽȽɽʽ˽̽ͽνϽнѽҽӽԽսֽ׽ؽٽڽ۽ܽݽ޽߽�������������������������������������������������������������������������������������������������������������¾þľžƾǾȾɾʾ˾�';
    str2:=str2+'�;ξϾоѾҾӾԾվ־׾ؾپھ۾ܾݾ޾߾�������������������������������������������������������������������������������������������������������������¿ÿĿſƿǿȿɿʿ˿̿ͿοϿпѿҿӿԿտֿ׿ؿٿڿۿܿݿ޿߿�����������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������������������������������������������������������������������¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿������������������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������áâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ������������������������������������������������������������������������������';
    str2:=str2+'������������������������������������������������ġĢģĤĥĦħĨĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿ������������������������������������������������������������������������������������������������������������������������������šŢţŤťŦ';
    str2:=str2+'ŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽžſ������������������������������������������������������������������������������������������������������������������������������ơƢƣƤƥƦƧƨƩƪƫƬƭƮƯưƱƲƳƴƵƶƷƸƹƺƻƼƽƾƿ����������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������ǡǢǣǤǥǦǧǨǩǪǫǬǭǮǯǰǱǲǳǴǵǶǷǸǹǺǻǼǽǾǿ����������������������������������������������������������������������';
    str2:=str2+'��������������������������������������������������������ȡȢȣȤȥȦȧȨȩȪȫȬȭȮȯȰȱȲȳȴȵȶȷȸȹȺȻȼȽȾȿ������������������������������������������������������������������������������������������������������������������������������ɡɢ';
    str2:=str2+'ɣɤɥɦɧɨɩɪɫɬɭɮɯɰɱɲɳɴɵɶɷɸɹɺɻɼɽɾɿ������������������������������������������������������������������������������������������������������������������������������ʡʢʣʤʥʦʧʨʩʪʫʬʭʮʯʰʱʲʳʴʵʶʷʸʹʺʻʼʽʾʿ��';
    str2:=str2+'����������������������������������������������������������������������������������������������������������������������������ˡˢˣˤ˥˦˧˨˩˪˫ˬ˭ˮ˯˰˱˲˳˴˵˶˷˸˹˺˻˼˽˾˿��������������������������������������������������������������';
    str2:=str2+'����������������������������������������������������������������̴̵̶̷̸̡̢̧̨̣̤̥̦̩̪̫̬̭̮̯̰̱̲̳̹̺̻̼̽̾̿��������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'����ͣͤͥͦͧͨͩͪͫͬͭͮͯ͢͡ͰͱͲͳʹ͵Ͷͷ͸͹ͺͻͼͽ;Ϳ������������������������������������������������������������������������������������������������������������������������������Ρ΢ΣΤΥΦΧΨΩΪΫάέήίΰαβγδεζηθικλμ';
    str2:=str2+'νξο������������������������������������������������������������������������������������������������������������������������������ϡϢϣϤϥϦϧϨϩϪϫϬϭϮϯϰϱϲϳϴϵ϶ϷϸϹϺϻϼϽϾϿ������������������������������������������������������';
    str2:=str2+'������������������������������������������������������������������������СТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмноп������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'������������ѡѢѣѤѥѦѧѨѩѪѫѬѭѮѯѰѱѲѳѴѵѶѷѸѹѺѻѼѽѾѿ������������������������������������������������������������������������������������������������������������������������������ҡҢңҤҥҦҧҨҩҪҫҬҭҮүҰұҲҳҴҵҶҷҸ';
    str2:=str2+'ҹҺһҼҽҾҿ������������������������������������������������������������������������������������������������������������������������������ӡӢӣӤӥӦӧӨөӪӫӬӭӮӯӰӱӲӳӴӵӶӷӸӹӺӻӼӽӾӿ����������������������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������ԡԢԣԤԥԦԧԨԩԪԫԬԭԮԯ԰ԱԲԳԴԵԶԷԸԹԺԻԼԽԾԿ����������������������������������������������������������������������������������������������������������';
    str2:=str2+'��������������������աբգդեզէըթժիլխծկհձղճմյնշոչպջռսվտ������������������������������������������������������������������������������������������������������������������������������ְֱֲֳִ֢֣֤֥֦֧֪֭֮֡֨֩֫֬֯';
    str2:=str2+'ֵֶַָֹֺֻּֽ־ֿ������������������������������������������������������������������������������������������������������������������������������סעףפץצקרשת׫׬׭׮ׯװױײ׳״׵׶׷׸׹׺׻׼׽׾׿��������������������������������������';
    str2:=str2+'������������������������������������������������������������������������������';
    cbb1.Items.Add(str1);
    strslist.Add(str2);
    str1:= '�����ֿ�';
    str2:='�����������������������������������������������������������������������������������������������������������������������������������ÁāŁƁǁȁɁʁˁ́́΁ρЁсҁӁԁՁցׁ؁فځہ܁݁ށ߁��������������������������������������';
    str2:=str2+'���������������������������������������������������������������������������������������������������������������������������������������ÂĂłƂǂȂɂʂ˂̂͂΂ςЂт҂ӂԂՂւׂ؂قڂۂ܂݂ނ߂����������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������ÃăŃƃǃȃɃʃ˃̃̓΃σЃу҃ӃԃՃփ׃؃كڃۃ܃݃ރ߃������������������������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������ÄĄńƄǄȄɄʄ˄̄̈́΄τЄф҄ӄԄՄքׄ؄لڄۄ܄݄ބ߄��������������������������';
    str2:=str2+'���������������������������������������������������������������������������������������������������������������������������������������������������ÅąŅƅǅȅɅʅ˅̅ͅ΅υЅх҅ӅԅՅօׅ؅مڅۅ܅݅ޅ߅�����������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������ÆĆņƆǆȆɆʆˆ̆͆ΆφІц҆ӆԆՆֆ׆؆نچۆ܆݆ކ߆���������������������';
    str2:=str2+'���������������������������������������������������������������������������������������������������������������������������������������������������������ÇćŇƇǇȇɇʇˇ͇̇·χЇч҇ӇԇՇևׇ؇هڇۇ܇݇އ߇������������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������ÈĈňƈǈȈɈʈˈ͈̈ΈψЈш҈ӈԈՈֈ׈؈وڈۈ܈݈ވ߈����������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������ÉĉŉƉǉȉɉʉˉ͉̉ΉωЉщ҉ӉԉՉ։׉؉ىډۉ܉݉މ߉��������������';
    str2:=str2+'����������������������������������������������������������������������������������������������������������������������������������������������������������������ÊĊŊƊǊȊɊʊˊ̊͊ΊϊЊъҊӊԊՊ֊׊؊يڊۊ܊݊ފߊ������������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������������������������������������������������������������ËċŋƋǋȋɋʋˋ̋͋΋ϋЋыҋӋԋՋ֋׋؋ًڋۋ܋݋ދߋ����������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������ÌČŌƌǌȌɌʌˌ̌͌ΌόЌьҌӌԌՌ֌׌،ٌڌی܌݌ތߌ��������';
    str2:=str2+'����������������������������������������������������������������������������������������������������������������������������������������������������������������������ÍčōƍǍȍɍʍˍ͍̍΍ύЍэҍӍԍՍ֍׍؍ٍڍۍ܍ݍލߍ������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÎĎŎƎǎȎɎʎˎ͎̎ΎώЎюҎӎԎՎ֎׎؎َڎێ܎ݎގߎ����';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÏďŏƏǏȏɏʏˏ̏͏ΏϏЏяҏӏԏՏ֏׏؏ُڏۏ܏ݏޏߏ�';
    str2:=str2+'����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÐĐŐƐǐȐɐʐː̐͐ΐϐАѐҐӐԐՐ֐אِؐڐېܐݐ�';
    str2:=str2+'�ߐ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÑđőƑǑȑɑʑˑ̑͑ΑϑБёґӑԑՑ֑בّؑڑۑ�';
    str2:=str2+'�ݑޑߑ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÒĒŒƒǒȒɒʒ˒̒͒ΒϒВђҒӒԒՒ֒גْؒ�';
    str2:=str2+'�ےܒݒޒߒ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÓēœƓǓȓɓʓ˓͓̓ΓϓГѓғӓԓՓ֓ד�';
    str2:=str2+'�ٓړۓܓݓޓߓ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÔĔŔƔǔȔɔʔ˔͔̔ΔϔДєҔӔԔՔ�';
    str2:=str2+'�הؔٔڔ۔ܔݔޔߔ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÕĕŕƕǕȕɕʕ˕͕̕ΕϕЕѕҕӕ�';
    str2:=str2+'�Օ֕וٕؕڕەܕݕޕߕ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÖĖŖƖǖȖɖʖ˖̖͖ΖϖЖі�';
    str2:=str2+'�ӖԖՖ֖זٖؖږۖܖݖޖߖ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������×ėŗƗǗȗɗʗ˗̗͗Ηϗ�';
    str2:=str2+'�їҗӗԗ՗֗חؗٗڗۗܗݗޗߗ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ØĘŘƘǘȘɘʘ˘̘͘�';
    str2:=str2+'�ϘИјҘӘԘ՘֘טؘ٘ژۘܘݘޘߘ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÙęřƙǙșəʙ˙�';
    str2:=str2+'�͙ΙϙЙљҙәԙՙ֙יؙٙڙۙܙݙޙߙ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÚĚŚƚǚȚɚ�';
    str2:=str2+'�˚͚̚ΚϚКњҚӚԚ՚֚ךؚٚښۚܚݚޚߚ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÛěśƛǛ�';
    str2:=str2+'�ɛʛ˛̛͛ΛϛЛћқӛԛ՛֛כ؛ٛڛۛܛݛޛߛ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������ÜĜŜ�';
    str2:=str2+'�ǜȜɜʜ˜̜͜ΜϜМќҜӜԜ՜֜ל؜ٜڜۜܜݜޜߜ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������Ý�';
    str2:=str2+'�ŝƝǝȝɝʝ˝̝͝ΝϝНѝҝӝԝ՝֝ם؝ٝڝ۝ܝݝޝߝ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�ÞĞŞƞǞȞɞʞ˞̞͞ΞϞОўҞӞԞ՞֞מ؞ٞڞ۞ܞݞޞߞ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'���ßğşƟǟȟɟʟ˟̟͟ΟϟПџҟӟԟ՟֟ן؟ٟڟ۟ܟݟޟߟ����������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'������� àĠŠƠǠȠɠʠˠ̠͠ΠϠРѠҠӠԠՠ֠נؠ٠ڠ۠ܠݠޠߠ������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'���������������������������������������������������������������������������������������������������������������������������������������������������°ðİŰưǰȰɰʰ˰̰ͰΰϰаѰҰӰ԰հְװذٰڰ۰ܰݰް߰����������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������±ñıűƱǱȱɱʱ˱̱ͱαϱбѱұӱԱձֱױرٱڱ۱ܱݱޱ߱��������������������';
    str2:=str2+'����������������������������������������������������������������������������������������������������������������������������������������������������������²òĲŲƲǲȲɲʲ˲̲ͲβϲвѲҲӲԲղֲײزٲڲ۲ܲݲ޲߲������������������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������������������������������������������������������³óĳųƳǳȳɳʳ˳̳ͳγϳгѳҳӳԳճֳ׳سٳڳ۳ܳݳ޳߳����������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������´ôĴŴƴǴȴɴʴ˴̴ʹδϴдѴҴӴԴմִ״شٴڴ۴ܴݴ޴ߴ�������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������µõĵŵƵǵȵɵʵ˵̵͵εϵеѵҵӵԵյֵ׵صٵڵ۵ܵݵ޵ߵ�����������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������¶öĶŶƶǶȶɶʶ˶̶Ͷζ϶жѶҶӶԶնֶ׶ضٶڶ۶ܶݶ޶߶���������';
    str2:=str2+'���������������������������������������������������������������������������������������������������������������������������������������������������������������������·÷ķŷƷǷȷɷʷ˷̷ͷηϷзѷҷӷԷշַ׷طٷڷ۷ܷݷ޷߷�������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������������¸øĸŸƸǸȸɸʸ˸̸͸θϸиѸҸӸԸոָ׸ظٸڸ۸ܸݸ޸߸�����';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������¹ùĹŹƹǹȹɹʹ˹̹͹ιϹйѹҹӹԹչֹ׹عٹڹ۹ܹݹ޹߹���';
    str2:=str2+'���������������������������������������������������������������������������������������������������������������������������������������������������������������������������ºúĺźƺǺȺɺʺ˺̺ͺκϺкѺҺӺԺպֺ׺غٺںۺܺݺ޺ߺ�';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������»ûĻŻƻǻȻɻʻ˻̻ͻλϻлѻһӻԻջֻ׻ػٻڻۻܻݻ�';
    str2:=str2+'�߻�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������¼üļżƼǼȼɼʼ˼̼ͼμϼмѼҼӼԼռּ׼ؼټڼۼ�';
    str2:=str2+'�ݼ޼߼�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������½ýĽŽƽǽȽɽʽ˽̽ͽνϽнѽҽӽԽսֽ׽ؽٽ�';
    str2:=str2+'�۽ܽݽ޽߽�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������¾þľžƾǾȾɾʾ˾̾;ξϾоѾҾӾԾվ־׾�';
    str2:=str2+'�پھ۾ܾݾ޾߾�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������¿ÿĿſƿǿȿɿʿ˿̿ͿοϿпѿҿӿԿտ�';
    str2:=str2+'�׿ؿٿڿۿܿݿ޿߿������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'���������������������������������������������������������������������������������������� ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿����������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������ÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ������������������������������';
    str2:=str2+'������������������������������������������������������������������������������������������������āĂăĄąĆćĈĉĊċČčĎďĐđĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿ��������������������������';
    str2:=str2+'����������������������������������������������������������������������������������������������������ŁłŃńŅņŇňŉŊŋŌōŎŏŐőŒœŔŕŖŗŘřŚśŜŝŞşŠšŢţŤťŦŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽžſ����������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������ƁƂƃƄƅƆƇƈƉƊƋƌƍƎƏƐƑƒƓƔƕƖƗƘƙƚƛƜƝƞƟƠơƢƣƤƥƦƧƨƩƪƫƬƭƮƯưƱƲƳƴƵƶƷƸƹƺƻƼƽƾƿ������������������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������ǁǂǃǄǅǆǇǈǉǊǋǌǍǎǏǐǑǒǓǔǕǖǗǘǙǚǛǜǝǞǟǠǡǢǣǤǥǦǧǨǩǪǫǬǭǮǯǰǱǲǳǴǵǶǷǸǹǺǻǼǽǾǿ��������������';
    str2:=str2+'����������������������������������������������������������������������������������������������������������������ȁȂȃȄȅȆȇȈȉȊȋȌȍȎȏȐȑȒȓȔȕȖȗȘșȚțȜȝȞȟȠȡȢȣȤȥȦȧȨȩȪȫȬȭȮȯȰȱȲȳȴȵȶȷȸȹȺȻȼȽȾȿ����������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������ɁɂɃɄɅɆɇɈɉɊɋɌɍɎɏɐɑɒɓɔɕɖɗɘəɚɛɜɝɞɟɠɡɢɣɤɥɦɧɨɩɪɫɬɭɮɯɰɱɲɳɴɵɶɷɸɹɺɻɼɽɾɿ������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������������������ʁʂʃʄʅʆʇʈʉʊʋʌʍʎʏʐʑʒʓʔʕʖʗʘʙʚʛʜʝʞʟʠʡʢʣʤʥʦʧʨʩʪʫʬʭʮʯʰʱʲʳʴʵʶʷʸʹʺʻʼʽʾʿ��';
    str2:=str2+'����������������������������������������������������������������������������������������������������������������������������ˁ˂˃˄˅ˆˇˈˉˊˋˌˍˎˏːˑ˒˓˔˕˖˗˘˙˚˛˜˝˞˟ˠˡˢˣˤ˥˦˧˨˩˪˫ˬ˭ˮ˯˰˱˲˳˴˵˶˷˸˹˺˻˼˽˾';
    str2:=str2+'˿������������������������������������������������������������������������������������������������������������������������������̴̵̶̷̸̡̢̧̨̛̖̗̘̙̜̝̞̟̠̣̤̥̦̩̪̫̬̭̮̯̰̱̲̳̹̺̻̼́̂̃̄̅̆̇̈̉̊̋̌̍̎̏̐̑̒̓̔̕̚';
    str2:=str2+'̽̾̿������������������������������������������������������������������������������������������������������������������������������͇͈͉͍͎́͂̓̈́͆͊͋͌ͅ͏͓͔͕͖͙͚͐͑͒͗͛ͣͤͥͦͧͨͩͪͫͬͭͮͯ͘͜͟͢͝͞͠͡ͰͱͲͳʹ͵Ͷͷ͸͹ͺ';
    str2:=str2+'ͻͼͽ;Ϳ������������������������������������������������������������������������������������������������������������������������������΁΂΃΄΅Ά·ΈΉΊ΋Ό΍ΎΏΐΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡ΢ΣΤΥΦΧΨΩΪΫάέήίΰαβγδεζηθ';
    str2:=str2+'ικλμνξο������������������������������������������������������������������������������������������������������������������������������ρςστυφχψωϊϋόύώϏϐϑϒϓϔϕϖϗϘϙϚϛϜϝϞϟϠϡϢϣϤϥϦϧϨϩϪϫϬϭϮϯϰϱϲϳϴϵ϶';
    str2:=str2+'ϷϸϹϺϻϼϽϾϿ������������������������������������������������������������������������������������������������������������������������������ЁЂЃЄЅІЇЈЉЊЋЌЍЎЏАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгд';
    str2:=str2+'ежзийклмноп������������������������������������������������������������������������������������������������������������������������������стуфхцчшщъыьэюяѐёђѓєѕіїјљњћќѝўџѠѡѢѣѤѥѦѧѨѩѪѫѬѭѮѯѰѱѲ';
    str2:=str2+'ѳѴѵѶѷѸѹѺѻѼѽѾѿ������������������������������������������������������������������������������������������������������������������������������ҁ҂҃҄҅҆҇҈҉ҊҋҌҍҎҏҐґҒғҔҕҖҗҘҙҚқҜҝҞҟҠҡҢңҤҥҦҧҨҩҪҫҬҭҮүҰ';
    str2:=str2+'ұҲҳҴҵҶҷҸҹҺһҼҽҾҿ������������������������������������������������������������������������������������������������������������������������������ӁӂӃӄӅӆӇӈӉӊӋӌӍӎӏӐӑӒӓӔӕӖӗӘәӚӛӜӝӞӟӠӡӢӣӤӥӦӧӨөӪӫӬӭӮ';
    str2:=str2+'ӯӰӱӲӳӴӵӶӷӸӹӺӻӼӽӾӿ������������������������������������������������������������������������������������������������������������������������������ԁԂԃԄԅԆԇԈԉԊԋԌԍԎԏԐԑԒԓԔԕԖԗԘԙԚԛԜԝԞԟԠԡԢԣԤԥԦԧԨԩԪԫԬ';
    str2:=str2+'ԭԮԯ԰ԱԲԳԴԵԶԷԸԹԺԻԼԽԾԿ������������������������������������������������������������������������������������������������������������������������������ՁՂՃՄՅՆՇՈՉՊՋՌՍՎՏՐՑՒՓՔՕՖ՗՘ՙ՚՛՜՝՞՟ՠաբգդեզէըթժ';
    str2:=str2+'իլխծկհձղճմյնշոչպջռսվտ������������������������������������������������������������������������������������������������������������������������������ցւփքօֆևֈ։֊֋֌֍֎֏֐֑֖֛֢֣֤֥֦֧֚֒֓֔֕֗֘֙֜֝֞֟֠֡֨';
    str2:=str2+'ְֱֲֳִֵֶַָֹֺֻּֽ֪֭֮֩֫֬֯־ֿ������������������������������������������������������������������������������������������������������������������������������ׁׂ׃ׅׄ׆ׇ׈׉׊׋׌׍׎׏אבגדהוזחטיךכלםמןנסעףפץצ';
    str2:=str2+'קרשת׫׬׭׮ׯװױײ׳״׵׶׷׸׹׺׻׼׽׾׿��������������������������������������������������������������������������������������������������������������������؁؂؃؄؅؆؇؈؉؊؋،؍؎؏ؘؙؚؐؑؒؓؔؕؖؗ؛؜؝؞؟ؠءآأؤإئابة';
    str2:=str2+'تثجحخدذرزسشصضطظعغػؼؽؾؿ������������������������������������������������������������������������������������������������������������������������������فقكلمنهوىيًٌٍَُِّْٕٖٜٟٓٔٗ٘ٙٚٛٝٞ٠١٢٣٤٥٦٧';
    str2:=str2+'٨٩٪٫٬٭ٮٯٰٱٲٳٴٵٶٷٸٹٺٻټٽپٿ������������������������������������������������������������������������������������������������������������������������������ځڂڃڄڅچڇڈډڊڋڌڍڎڏڐڑڒړڔڕږڗژڙښڛڜڝڞڟڠڡڢڣڤڥ';
    str2:=str2+'ڦڧڨکڪګڬڭڮگڰڱڲڳڴڵڶڷڸڹںڻڼڽھڿ������������������������������������������������������������������������������������������������������������������������������ہۂۃۄۅۆۇۈۉۊۋیۍێۏېۑےۓ۔ەۖۗۘۙۚۛۜ۝۞ۣ۟۠ۡۢ';
    str2:=str2+'ۤۥۦۧۨ۩۪ۭ۫۬ۮۯ۰۱۲۳۴۵۶۷۸۹ۺۻۼ۽۾ۿ������������������������������������������������������������������������������������������������������������������������������܁܂܃܄܅܆܇܈܉܊܋܌܍܎܏ܐܑܒܓܔܕܖܗܘܙܚܛܜܝܞܟܠܡ';
    str2:=str2+'ܢܣܤܥܦܧܨܩܪܫܬܭܮܯܱܴܷܸܹܻܼܾܰܲܳܵܶܺܽܿ������������������������������������������������������������������������������������������������������������������������������݂݄݆݈݁݃݅݇݉݊݋݌ݍݎݏݐݑݒݓݔݕݖݗݘݙݚݛݜݝݞݟ';
    str2:=str2+'ݠݡݢݣݤݥݦݧݨݩݪݫݬݭݮݯݰݱݲݳݴݵݶݷݸݹݺݻݼݽݾݿ������������������������������������������������������������������������������������������������������������������������������ށނރބޅކއވމފދތލގޏސޑޒޓޔޕޖޗޘޙޚޛޜޝ';
    str2:=str2+'ޞޟޠޡޢޣޤޥަާިީުޫެޭޮޯްޱ޲޳޴޵޶޷޸޹޺޻޼޽޾޿������������������������������������������������������������������������������������������������������������������������������߁߂߃߄߅߆߇߈߉ߊߋߌߍߎߏߐߑߒߓߔߕߖߗߘߙߚߛ';
    str2:=str2+'ߜߝߞߟߠߡߢߣߤߥߦߧߨߩߪ߲߫߬߭߮߯߰߱߳ߴߵ߶߷߸߹ߺ߻߼߽߾߿��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    str2:=str2+'������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������';
    cbb1.Items.Add(str1);
    strslist.Add(str2);
    for i:=0 to temlist.Count-1 do
    begin
      temstr:=temlist.Strings[i];
      j:=Pos('=',temstr);
      if j>0 then
      begin
        str1:=StrLeft(temstr,j-1);
        str2:=StrRight(temstr,(Length(temstr)-j));
        cbb1.Items.Add(str1);
        strslist.Add(str2);
      end;
    end;
  end;
  temlist.Free ;
end;

 function TFrmmain.showword:string;
var
  s:string;
begin
  if wordlist.Count>0 then
  begin
    if rg1.ItemIndex=0 then
    begin
      randomize;
      wordrec:=1+Random(wordlist.Count) ;
    end
    else
    begin
      if wordrec<wordlist.Count then
      wordrec :=wordrec+1
      else
      wordrec :=1;
    end;
    s:=wordlist.Strings[wordrec-1];
    Result:=s;
  end;
end;

procedure TFrmmain.tmr1Timer(Sender: TObject);
begin
  Showword_lbl;
end;

procedure TFrmmain.rg2Click(Sender: TObject);
begin
  if rg2.ItemIndex=1 then
  begin
    tmr1.Interval:=se1.Value;
    tmr1.Enabled :=True;
  end
  else
  begin
    tmr1.Enabled :=False;
  end;
end;

procedure TFrmmain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_space then  Showword_lbl;
end;

procedure TFrmmain.btn1Click(Sender: TObject);
begin
 with TFrminput.Create(Self) do
   begin
     ShowModal ;
     Free;
   end;
end;

procedure TFrmmain.btn2Click(Sender: TObject);
begin
  dlgFontLBL.Font.Name :='����';
  dlgFontLBL.Font.Size :=160;
  if dlgFontLBL.Execute then
  lbl1.Font:=dlgFontLBL.Font ;
end;

procedure TFrmmain.btn3Click(Sender: TObject);
begin
  Frmmain.ActiveControl :=nil ;
end;

procedure TFrmmain.lbl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Showword_lbl;
end;

procedure TFrmmain.Showword_lbl;
begin
   lbl1.Caption :=showword  ;
   lbl2.Caption :='���ֿ��й���'+inttostr(wordlist.Count)+'���֡��� '+IntToStr(wordrec)+' ��';
end;

procedure TFrmmain.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Showword_lbl;
end;

procedure TFrmmain.se1Change(Sender: TObject);
begin
  if Length(se1.Text)=0 then SE1.Value :=1000;
  tmr1.Interval:=se1.Value;
end;

procedure TFrmmain.N1Click(Sender: TObject);
begin
 if (Sender as TMenuItem).Checked =False then
  begin
    setwindowpos(handle,hwnd_topmost,left,top,width,height,swp_showwindow);
    (Sender as TMenuItem).Checked :=True;
  end
  else
  begin
    setwindowpos(handle,hwnd_notopmost,left,top,width,height,swp_showwindow);
    (Sender as TMenuItem).Checked :=False ;
  end;
end;

procedure TFrmmain.N3Click(Sender: TObject);
begin
  creatdesktoplink('�ٶ�ʶ������');
end;

procedure TFrmmain.btn4Click(Sender: TObject);
var
  I:Integer ;
begin
  i:=StrToInt(lbl3.Caption);
  pb1.Canvas.Draw(i*18,0,yesbmp);
  lbl3.Caption :=IntToStr(i+1);
  sndplaysound(rightsound,snd_async or snd_Memory);
end;

procedure TFrmmain.btn5Click(Sender: TObject);
var
  j:Integer;
begin
  j:=StrToInt(lbl4.Caption);
  pb2.Canvas.Draw(j*18,0,nobmp);
  lbl4.Caption :=IntToStr(j+1);
  sndplaysound(wrongsound,snd_async or snd_Memory);
end;

end.           
