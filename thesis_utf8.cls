% ***************** Клас для написання диплому *****************
% ************************ БОРИСЕНКО П.Б. **********************
% **************** на основі класу ТАВРОВА Д.Ю. ****************
% ************************* 25.05.14 ***************************
% ************************* 27.05.14 ***************************
% ************************* 29.05.14 ***************************
% *********** Виправлення Дутчака І.О. від 02.06.14 ************
% *********** Виправлення Таврова Д.Ю. від 02.06.14 ************
% ************************* 05.06.14 ***************************
% ************************* 08.06.14 ***************************
% ************************* 09.06.14 ***************************
% *********** Виправлення Таврова Д.Ю. від 10.06.14 ************
% *********** Виправлення Дутчака І.О. від 11.06.14 ************
% *********** Виправлення Таврова Д.Ю. від 12.06.14 ************
% *********** Виправлення Сахарова С.Ю. від 12.06.14 ***********
% *********** Виправлення Дутчака І.О. від 14.06.14 ************

% Доступні команди:
% \maketitlepage{ПІБ}{група}{керівник}{рецензент}{тема}
% \assigment{параметри}, де параметри це розділені комами пари вигляду параметр={значення}:
%  StudentName -- ім'я студента в родовому відмінку
%  ThesisName -- тема диплому
%  AdvisorName -- посада та ім'я керівника
%  Order -- дата та номер наказу
%  ApplicationDate -- дата подання диплому
%  InputData -- вхідні дані диплому
%  Contents -- зміст записки
%  Graphics -- перелік графічних матеріалів
%  AssigmentDate -- дата отримання завдання
%  Calendar -- внутрішня частина таблиці з календарним планом
%  StudentPIB -- Прізвище І.Б. студента
%  AdvisorPIB -- Прізвище І.Б. керівника
% \annotation{заголовок}
% \total{лічильник}, де лічильник -- це одне з наступних значень:
%  page -- кількість сторінок
%  pages-- кількість сторінок без додатків
%  equations -- кількість рівнянь
%  figure -- кількість рисунків всього (поки не працює)
%  figures -- кількість рисунків без тих, що в додатках (поки не працює)
%  table -- кількість таблиць всього (поки не працює)
%  tables -- кількість таблиць без тих, що в додатках (поки не працює)
%  bibitemcount -- кількість елементів списку посилань (не працює автоматично)
%  appendnum --  кількість додатків
% \tableofcontents
% \shortings
% \intro
% \conclusion
% \begin{thebibliography} .. \end{thebibliography}
% \append{назва}

% 1. Ідентифікуємо клас
\ProvidesClass{thesis_utf8}[2014/06/12 v2.4 Клас для написання диплому]
\NeedsTeXFormat{LaTeX2e} % потрібний формат

% 2. Завантажуємо "батьківський клас"
\LoadClass[a4paper,14pt,pdftex,ukrainian,oneside]{extreport}

% 3. Завантажуємо пакети
% мовні пакети
\RequirePackage{cmap}% для кодування шрифтів у pdf
\RequirePackage[T2A]{fontenc} % пакет для підтримки кирилічних шрифтів
\RequirePackage[utf8]{inputenc} % пакет для підтримкм Windows'івського кодування cp1251
\RequirePackage[english,ukrainian]{babel} % пакет для підтримки української та російської мов
\RequirePackage{pscyr} % пакет із гарними кирилічними шрифтами
\RequirePackage{mathtext} % потрібні символи в режимі математичних формул
\RequirePackage{amssymb,amsfonts,amsmath,amsthm} % потрібні символи в режимі математичних формул
\RequirePackage{textcomp} % потрібні символи в режимі математичних формул
\RequirePackage{upgreek} % пакет для прямих грецьких літер

% графічні пакети
\RequirePackage[pdftex]{graphicx} % основний пакет для вставки графіки
\RequirePackage{pdfpages}
\RequirePackage{subfig} % пакет для вставки підрисунків
\RequirePackage{flafter} % пакет гарантує, що рисунок чи таблица ніколи не з'являться раніше посилання на саму себе
\RequirePackage{caption} % пакет для персоналізації заголовків рисунків та таблиць
\RequirePackage{xtab} % пакет для довгих таблиць
\RequirePackage{longtable} % пакет для довгих таблиць
\RequirePackage{multirow} % пакет для об'єднання рядків таблиці

% пакети для форматування відступів та полів
\RequirePackage[includeheadfoot, headsep=0pt, top=2cm, bottom=2cm, left=3cm, right=2cm]{geometry} % задаємо поля сторінки
\RequirePackage{indentfirst} % відступ для першого рядка абзацу
\RequirePackage{hanging} % відступ для всіх інших рядків абзацу
\RequirePackage{enumitem}  % пакет для форматування списків
\RequirePackage{setspace}  % пакет для того, щоб можна було задати міжрядковий інтервал
\RequirePackage{fancyhdr} % пакет потрібний для виставлення позиції номеру сторінки
\RequirePackage{etoolbox} % пакет для прибирання висячого відступу в бібліографії

% стилі заголовків та змісту
\RequirePackage[rm,small,raggedright,explicit]{titlesec} % пакет для ручного керування стилем заголовків
\RequirePackage[titles,subfigure]{tocloft} % пакет для ручного керування стилем змісту

% пакет для коректного представлення інтернет-посилань у "Джерелах"
\RequirePackage{url}

% пакет для нормальних пробілів після ком у десяткових дробах
\RequirePackage{icomma}

% пакет для відображення форматування вихідних кодів
\RequirePackage{listings}

% пакет для параметричних команд
\RequirePackage{xkeyval}

%наступні залежності можна закоментувати/розкоментувати за потреби:

% пакет для лічильників
\RequirePackage{totcount}

% пакет для створення нових стилів для вирівнювання колонок в таблицях
\RequirePackage{array}

% для гарних перших комірок в таблицях (з даігональною полоскою)
\RequirePackage{diagbox}

% 4. Основна частина
\linespread{1.5} % інтервал "1,5"
\renewcommand{\rmdefault}{ftm} % задаємо шрифт за промовчанням --- "Times New Roman" із пакету pscyr

\newcommand{\setfontsize}[1]{\fontsize{#1pt}{#1pt}\selectfont} % команда для задавання розміру шрифта
\newcommand{\invcommas}[1]{\guillemotleft #1\guillemotright} % команда для французьких кутових лапок

% текст гіперпосилань буде того ж шрифту, що й основний текст
\urlstyle{same}

% стиль сторінки для позиції номеру сторінки
\fancypagestyle{plain}{
    \fancyhf{}
    \rhead{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% команди для заборони розриву формул у небажаному місці
\binoppenalty=10000
\relpenalty=10000

% ініціалізовуємо лічильники
\@ifpackageloaded{totcount}{
    \regtotcounter{chapter}
    \regtotcounter{section}
    \regtotcounter{subsection}
    \regtotcounter{subsubsection}
    \regtotcounter{paragraph}
    \regtotcounter{subparagraph}
    \regtotcounter{page}
    \regtotcounter{equation}
    \regtotcounter{figure}
    \regtotcounter{table}
    \newtotcounter{bibitemcount}

    % це тимчасово, поки не запрацють лічильники, типу tables, figures
    \newtotcounter{tablecount}
    \newtotcounter{figurecount}
}{}

% команда для створення ненумерованого розділу, який тим не менше показується в змісті
\newcommand{\uchapter}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}

% для створення вступу використаємо команду \uchapter
\newcommand{\intro}{\uchapter{Вступ}}

% для створення висновків використаємо команду \uchapter
\newcommand{\conclusion}{\uchapter{Висновки}}

% для створення перелік умовних позначень використаємо команду \shortings
\newcommand{\shortings}{\uchapter{Перелік умовних позначень, скорочень і термінів}}

% хитра команда для створення додатків
\newcounter{pages}\@ifpackageloaded{totcount}{\regtotcounter{pages}}{}
\newcounter{appendnum}\@ifpackageloaded{totcount}{\regtotcounter{appendnum}}{}
\newcommand{\append}[1]{
    \titleformat{\chapter}{\centering\normalsize}{\hspace{1cm}\thechapter}{0.5em}{##1}
    \titlespacing{\chapter}{0pt}{0pt}{0pt}
    \ifnum \value{appendnum}=1 \setcounter{pages}{\value{page}} \fi
    %\ifnum \arabic{appendnum}=1 \ucahpter{Додатки} \else \clearpage \fi
    \chapter*{Додаток \Asbuk{appendnum}}
    \begin{center}
        #1
    \end{center}
    \titlespacing{\chapter}{0pt}{0pt}{49pt}
    \titleformat{\chapter}{\centering\normalsize}{\hspace{1cm}\thechapter}{0.5em}{\MakeUppercase{#1}}
    \addcontentsline{toc}{chapter}{Додаток \Asbuk{appendnum}\ #1}
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \renewcommand{\thefigure}{\Asbuk{appendnum}.\arabic{figure}}
    \renewcommand{\thetable}{\Asbuk{appendnum}.\arabic{table}}
}
% прибираємо недопустимі букви з позначення додатків
\pretocmd\append{
    \stepcounter{appendnum}
    \ifnum\Asbuk{appendnum}=Ґ \stepcounter{appendnum}\fi
    \ifnum\Asbuk{appendnum}=Є \stepcounter{appendnum}\fi
    \ifnum\Asbuk{appendnum}=З \stepcounter{appendnum}\fi
    \ifnum\Asbuk{appendnum}=І \stepcounter{appendnum}\fi
    \ifnum\Asbuk{appendnum}=Ї \stepcounter{appendnum}\fi
    \ifnum\Asbuk{appendnum}=Й \stepcounter{appendnum}\fi
    \ifnum\Asbuk{appendnum}=О \stepcounter{appendnum}\fi
    \ifnum\Asbuk{appendnum}=Ч \stepcounter{appendnum}\fi
    \ifnum\Asbuk{appendnum}=Ь \stepcounter{appendnum}\fi
}{}{}

% будемо змінювати стилі заголовків
% спочатку --- для розділу
\titleformat{\chapter} % указуємо, що модифікуємо саме розділ
{\centering\normalsize} % указуємо формат назви (жирний, "усі великі")
{\hspace{1cm}\thechapter} % указуємо формат власне номера: це буде просто число, без крапки
{0.5em} % відстань між номером і назвою
{\MakeUppercase{#1}} % текст, що передує назві

% тепер --- для підрозділу
\titleformat{\section}[block] % указуємо, що модифікуємо саме підрозділ
{\normalsize} % указуємо формат назви (жирний)
{\hspace{1.25cm}\thesection} % указуємо формат власне номера: це буде просто число, без крапки
{0.5em} % відстань між номером і назвою
{#1} % текст, що передує назві

% тепер --- для підрозділу ще нижчого рівня
\titleformat{\subsection}[block] % указуємо, що модифікуємо саме підрозділ нижнього рівня
{\normalsize} % указуємо формат назви (жирний)
{\hspace{1.25cm}\thesubsection} % указуємо формат власне номера: це буде просто число, без крапки
{0.5em} % відстань між номером і назвою
{#1} % текст, що передує назві

% тепер задамо відступи для заголовку розділу
\titlespacing{\chapter} % указуємо, що модифікуємо саме розділ
{0pt} % відступ зліва
{0pt} % відступ зверху (немає)
{42pt} % відступ знизу (2 рядки)

% тепер задамо відступи для заголовку підрозділу
\titlespacing{\section} % указуємо, що модифікуємо саме підрозділ
{0pt} % відступ зліва
{42pt} % відступ зверху (2 рядки)
{42pt} % відступ знизу (2 рядки)

% тепер задамо відступи для заголовку підрозділу ще нижчого рівня
\titlespacing{\subsection} % указуємо, що модифікуємо саме підрозділ нижнього рівня
{0pt} % відступ зліва
{42pt} % відступ зверху (2 рядки)
{42pt} % відступ знизу (2 рядки)


% тепер зробимо так, щоб між двома заголовками була звичайна відстань
\preto\section{%
    \ifnum\value{section}=0\addvspace{-42pt}\fi%
}

\preto\subsection{%
    \ifnum\value{subsection}=0\addvspace{-42pt}\fi%
}

% видозмінюємо зміст
\makeatletter
\renewcommand{\tableofcontents}{
    \clearpage
    \thispagestyle{plain}

    \begin{center}
        Зміст
    \end{center}

    \@starttoc{toc}
}
\makeatother

% підганяємо висоту рядка в таблиці
\renewcommand{\arraystretch}{1.5}

% змінюємо формат нумерації формул
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% задамо оновлені списки, з правильними відступами
% нумерований першого рівня
\AddEnumerateCounter{\asbuk}{\@asbuk}{\cyrm}
\setlist[itemize,1]{label=-, partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=1.7cm, leftmargin=0pt}
\setlist[enumerate,1]{label=\asbuk*), partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=1.9cm, leftmargin=0pt}
\setlist[itemize,2]{label=-, partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=2.6cm, leftmargin=0pt}
\setlist[enumerate,2]{label=\arabic*), partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=2.6cm, leftmargin=0pt}

% тепер займемося змістом
% задаємо відстань між точками
\renewcommand{\cftchapdotsep}{1}
\renewcommand{\cftsecdotsep}{1}
\renewcommand{\cftsubsecdotsep}{1}

% задаємо розмір поля, що виділяється під номер сторінки
\cftsetpnumwidth{1em}

% задамо відстані між рядками в змісті
\setlength\cftbeforechapskip{0pt}

% займемося розділами
\renewcommand{\cftchapaftersnum}{} % що буде писатися після номеру розділу (нічого)
\renewcommand{\cftchapindent}{0cm} % відступ номера розділу від лівого краю
\renewcommand{\cftchapnumwidth}{1em} % розмір поля, що виділяється під номер розділу
\renewcommand{\cftchappagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftchapfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% тепер займемося підрозділами
\renewcommand{\cftsecaftersnum}{} % що буде писатися після номеру підрозділу (нічого)
\renewcommand{\cftsecindent}{1em} % відступ номера підрозділу від лівого краю
\renewcommand{\cftsecnumwidth}{2em} % розмір поля, що виділяється під номер підрозділу
\renewcommand{\cftsecpagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftsecfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% тепер займемося підрозділами ще нижчого рівня
\renewcommand{\cftsubsecaftersnum}{} % що буде писатися після номеру підрозділу нижнього рівня (нічого)
\renewcommand{\cftsubsecindent}{3em} % відступ номера підрозділу нижнього рівня від лівого краю
\renewcommand{\cftsubsecnumwidth}{2.5em} % розмір поля, що виділяється під номер підрозділу нижнього рівня
\renewcommand{\cftsubsecpagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftsubsecfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftsubsecdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% заголовки таблиць, рисунків і лістингів
\DeclareCaptionLabelFormat{tablecap}{Таблиця #2} % формат за промовчанням "Табл." не влаштовує
\DeclareCaptionLabelFormat{figurecap}{Рисунок #2} % формат за промовчанням "Рис." не влаштовує

\captionsetup[table]{margin=0pt,singlelinecheck=false, justification=justified, labelsep=endash, labelformat=tablecap, font = {stretch = 1.5}} % формат для таблиць
\captionsetup[figure]{justification=centering, labelsep=endash, labelformat=figurecap, font = {stretch = 1.5}} % формат для рисунків

\makeatletter
% форматування вихідних кодів
\@ifpackageloaded{listings}{
    \DeclareCaptionFormat{listing}{Лістинг файлу #3} % формат за промовчанням "Listing" не влаштовує
    \captionsetup[lstlisting]{margin=0pt, format=listing, singlelinecheck=false, font = {stretch = 1.5}} % формат для лістингів
}{}

% додаткові стилі для вирівнювання колонок в таблицях
\@ifpackageloaded{array}{
    \newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash}p{#1}}
    \newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash}p{#1}}
    \newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash}p{#1}}
}{}
\makeatother

% команда, що змінює латинські літери на кирилічні в підрисунках
\renewcommand{\thesubfigure}{\asbuk{subfigure}}

% нове оточення для довгих таблиць
\renewenvironment{table}[4]{
    \begin{center}
        \begin{longtable}{#1}
            \kill
            \caption{#2}\label{#3}\\
            #4
        \endfirsthead
        \kill
        \caption*{Продовження таблиці \thetable}\\
        #4
    \endhead
    \hline
\endfoot
}
{%
\end{longtable}
    \end{center}
}
\setlength{\LTpre}{-14pt}
\setlength{\LTpost}{-14pt}
\setlength{\LTcapwidth}{0pt}

% наведемо порядок із відступами в бібліографії
\patchcmd{\thebibliography}
{\advance\leftmargin\labelsep}
{\leftmargin=0pt\itemindent=1.9cm\advance\itemindent\labelsep}
{}{}

% змінюємо формат номеру для списку джерел (число + крапка)
\makeatletter
\renewcommand{\@biblabel}[1]{#1.}
\makeatother

% оновимо стандартне оточення, оскільки потрібно додати список джерел у зміст
\let\tempbib\thebibliography
\let\tempbibend\endthebibliography
\renewenvironment{thebibliography}{
    \renewcommand{\bibname}{ПЕРЕЛІК ПОСИЛАНЬ}% змінюємо заголовок
    \tempbib{99.}% максимально можливий номер джерела --- 99
    % далі наведемо порядок із відступами
    \setlength\partopsep{0pt}
    \setlength\parskip{0pt}
    \setlength\parsep{0pt}
    \setlength\topsep{0pt}
    \setlength\itemsep{0pt}
    \addcontentsline{toc}{chapter}{Перелік посилань}% додаємо в зміст
}
{
    \tempbibend
}

% нова команда для титульного аркушу
% згідно прикладу з сайту факультету з незначними виправленнями
\newcommand{\maketitlepage}[5]{
    \begin{titlepage}
    % \thispagestyle{empty}
    \setlength{\parindent}{0cm}
    \begin{center} % центрування
        \textbf{\MakeUppercase{Національний технічний університет України}}

        \textbf{\MakeUppercase{\invcommas{Київський політехнічний інститут}}}

        \addvspace{1em}

        Факультет прикладної математики

        Кафедра прикладної математики

        \addvspace{6pt} % невеликий відступ

        \setfontsize{13}
        \begin{minipage}{0.3\textwidth}
            \renewcommand{\arraystretch}{0.8}
            \begin{tabular}{l}
                \invcommas{На правах рукопису}\\
                УДК 656.073\\
                \\
                \\
            \end{tabular}
        \end{minipage}
        \hfill
        \begin{minipage}{0.4\textwidth}
            \invcommas{До захисту допущено}

            \vspace{0.5em}

            \renewcommand{\arraystretch}{0.8}
            \begin{tabular}{l}
                % \invcommas{До захисту допущено} \\
                Завідувач кафедри\\
                \underline{\hspace{6em}}~О.\,Р.~Чертов\\
                \invcommas{\underline{\hspace{2em}}}~\underline{\hspace{5em}}~\the\year~р.\\

            \end{tabular}
        \end{minipage}

        \vfill

        \setfontsize{20}
        \textbf{Магістерська дисертація}%\MakeUppercase
        \setfontsize{13}

        \textbf{на здобуття ступеня магістра}
    \end{center}
    \setfontsize{13}
    {
        \renewcommand{\arraystretch}{1}
        \begin{tabular}{p{0.9\textwidth}}
            зі спеціальності 8.04030101 \invcommas{Прикладна математика}\\
            на тему: #5\\
        \end{tabular}
    }

    \vfill % невеликий відступ

    \begin{tabular}{p{0.25\textwidth} p{0.55\textwidth} b{0.1\textwidth}}
        \multicolumn{3}{l}{Виконав: студент 2 курсу, групи {#2}}\\
        \multicolumn{2}{l}{{#1}} & \underline{\hspace{0.1\textwidth}}\\
        Науковий керівник & {#3} & \underline{\hspace{0.1\textwidth}}\\
        Консультант із~\mbox{\hspace{2em}} нормоконтролю & старший викладач Мальчиков~В.\,В. & \underline{\hspace{0.1\textwidth}}\\
        Рецензент & {#4} & \underline{\hspace{0.1\textwidth}}
    \end{tabular}

    \vfill % автоматично заповнюємо проміжок

    \begin{flushright}
        \renewcommand{\arraystretch}{0.8}
        \begin{tabular}{l}
            Засвідчую, що у цій магістерській\\
            дисертації немає запозичень з праць інших\\
            авторів без відповідних посилань.\\
            Студент~\_\_\_\_\_\_\_\_\_\_\_\_\_
        \end{tabular}
    \end{flushright}

    \vfill

    \begin{center}
        Київ --- \the\year\ року
    \end{center}
    \end{titlepage}

    \clearpage % починаємо з нової сторінки

    \setcounter{page}{2} % номер сторінки буде 2

    \setlength{\parindent}{1.25cm} % задаємо відступ першого рядка абзацу (5 знаків, або 1,25 см)

    % пропуск рядка до та після формули
    \setlength{\belowdisplayskip}{14pt}
    \setlength{\abovedisplayskip}{14pt}
    \setlength{\belowdisplayshortskip}{14pt}
    \setlength{\abovedisplayshortskip}{14pt}
}

% нова команда для анотації
\newcommand{\annotation}[1]{\chapter*{#1}\thispagestyle{empty}\renewcommand{\baselinestretch}{1.5}\setfontsize{14pt}}

% нова команда для побудови завдання
\makeatletter
\define@cmdkey[Thesis]{Assigment}{StudentName}{}
\define@cmdkey[Thesis]{Assigment}{ThesisName}{}
\define@cmdkey[Thesis]{Assigment}{AdvisorName}{}
\define@cmdkey[Thesis]{Assigment}{Order}{}
\define@cmdkey[Thesis]{Assigment}{ApplicationDate}{}
\define@cmdkey[Thesis]{Assigment}{InputData}{}
\define@cmdkey[Thesis]{Assigment}{Contents}{}
\define@cmdkey[Thesis]{Assigment}{Graphics}{}
\define@cmdkey[Thesis]{Assigment}{AssigmentDate}{}
\define@cmdkey[Thesis]{Assigment}{Calendar}{}
\define@cmdkey[Thesis]{Assigment}{StudentPIB}{}
\define@cmdkey[Thesis]{Assigment}{AdvisorPIB}{}
\newcommand{\assigment}[1]{
    \setkeys[Thesis]{Assigment}{#1}
    \pagestyle{empty}
    \setlength{\parindent}{0cm}
    \begin{center} % центрування
        \textbf{Національний технічний університет України}

        \textbf{\invcommas{Київський політехнічний інститут}}
    \end{center}

    Факультет прикладної математики

    Кафедра прикладної математики

    Освітньо-кваліфікаційний рівень \invcommas{Бакалавр}

    Напрям підготовки: 6.040301 \invcommas{Прикладна математика}

    \addvspace{12pt} % невеликий відступ

    \begin{flushright}
        \renewcommand{\arraystretch}{0.8}
        \begin{tabular}{l}

            \MakeUppercase{Затверджую} \\
            Завідувач кафедри ПМА\\
            \_\_\_\_\_\_\_\_\_\_\_\_\_~О.~А.~Молчанов \\
            \invcommas{\_\_\_\_}~\_\_\_\_\_\_\_\_\_\_\_\_\_~\the\year~р. \\

        \end{tabular}
    \end{flushright}

    \begin{center}
        \textbf{\MakeUppercase{Завдання}}

        \textbf{на дипломну роботу студенту}

        %\addvspace{14pt}

        \cmdThesis@Assigment@StudentName

    \end{center}

    1. Тема роботи: \cmdThesis@Assigment@ThesisName

    керівник роботи \cmdThesis@Assigment@AdvisorName,

    затверджені наказом по університету від   \cmdThesis@Assigment@Order.

    2. Строк подання студентом роботи:      \cmdThesis@Assigment@ApplicationDate

    3. Вихідні дані до роботи:           \cmdThesis@Assigment@InputData

    4. Перелік завдань, які потрібно розробити: \cmdThesis@Assigment@Contents

    5. Перелік графічного матеріалу:       \cmdThesis@Assigment@Graphics

    6. Консультанти розділів роботи:

    \addvspace{12pt}
    \begin{center}
        %\renewcommand{\arraystretch}{0.8}
        \begin{tabular}{|c|c|c|c|}
            \hline
            Розділ & Прізвище, ініціали та посада & \multicolumn{2}{c|}{Підпис, дата} \\ \cline{3-4}
            & консультанта & \parbox[t]{4em}{\centering{}завдання\\видав} & \parbox[t]{4em}{\centering{}завдання\\прийняв} \\
            \hline
            Охорона праці & Луц~Т.~Є., ст. викладач & & \\
            \hline
        \end{tabular}
    \end{center}

    \addvspace{12pt}

    7. Дата видачі завдання: \cmdThesis@Assigment@AssigmentDate

    %питання до Паші, хіба це не має бути тут?
    \clearpage

    \begin{center}
        Календарний план

        \addvspace{24pt}

        \renewcommand{\arraystretch}{0.8}
        \begin{longtable}{|c|p{12.5em}|p{8.5em}|c|}
            %\multicolumn{4}{c}{Календарний план}\\
            \hline
            \No\ з/п & \parbox[t]{12.5em}{\centering{}Назва етапів виконання\\дипломної роботи} & \parbox[t]{8.5em}{\centering{}Строк виконання\\етапів роботи} & Примітка \\
            \hline
            \kill\endfirsthead\endhead
    \hline\endfoot
\cmdThesis@Assigment@Calendar
            \end{longtable}

        \end{center}

        \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lrl}
            Студент &  \_\_\_\_\_\_\_\_\_\_\_\_\_ & \cmdThesis@Assigment@StudentPIB \\

            Керівник роботи & \_\_\_\_\_\_\_\_\_\_\_\_\_ & \cmdThesis@Assigment@AdvisorPIB \\
        \end{tabular*}

        \clearpage

        \pagestyle{plain}

        \setlength{\parindent}{1.25cm}
    }
    \makeatother

    %виправляємо помилки з апострофами в формулах
    \makeatletter
    \def\latex@@rquote{^\bgroup\prim@s}
    \let\hang@@h@ngrquote\h@ngrquote
    \renewcommand{\h@ngrquote}{
        \relax\ifmmode
        \expandafter\latex@@rquote
        \else
        \expandafter\hang@@h@ngrquote
        \fi}
    \makeatother

% \setlength{\jot}{42pt}
% \RequirePackage{xpatch}
% \xapptocmd\normalsize{%
%     \abovedisplayskip=42pt plus 3pt minus 9pt
%     \abovedisplayshortskip=36pt plus 3pt
%     \belowdisplayskip=42pt plus 3pt minus 9pt
%     \belowdisplayshortskip=36pt plus 3pt minus 4pt
% }{}{}
% \makeatletter
% \g@addto@macro\normalsize{%
%     \setlength\abovedisplayskip{42pt}
%     \setlength\belowdisplayskip{42pt}
%     \setlength\abovedisplayshortskip{42pt}
%     \setlength\belowdisplayshortskip{42pt}
% }
% \makeatother
