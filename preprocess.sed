s/^\\section{[^}]*}/\\end{frame}&\\begin{frame}\\frametitle{\\sectionprefix~\\insertsectionhead}/;
s/^\\sectionbreak\>/\\blfootnote{[\\textsl{\\insertsectionhead~is continued on the next slide.}]}\\end{frame}\\begin{frame}\\frametitle{\\sectionprefix~\\insertsectionhead~[\\textsl{continued}]}/;
s/^\\subsection{[^}]*}/\\end{frame}&\\begin{frame}\\frametitle{\\subsectionprefix~\\insertsubsectionhead}/;
s/^\\subsectionbreak\>/\\blfootnote{[\\textsl{\\insertsubsectionhead~is continued on the next slide.}]}\\end{frame}\\begin{frame}\\frametitle{\\subsectionprefix~\\insertsubsectionhead~[\\textsl{continued}]}/;
s/^\\subsubsection{[^}]*}/\\end{frame}&\\begin{frame}\\frametitle{\\subsubsectionprefix~\\insertsubsubsectionhead}/;
s/^\\subsubsectionbreak\>/\\blfootnote{[\\textsl{\\insertsubsubsectionhead~is continued on the next slide.}]}\\end{frame}\\begin{frame}\\frametitle{\\subsubsectionprefix~\\insertsubsubsectionhead~[\\textsl{continued}]}/;
s/^\\begin{thebibliography}{}/&\\begin{frame}\\frametitle{References}\\footnotesize/;
s/^\\end{thebibliography}/\\end{frame}&/;
s/^\\bibbreak\>/\\blfootnote{[\\textsl{References~is continued on the next slide.}]}\\end{frame}\\begin{frame}\\frametitle{References~[\\textsl{continued}]}\\footnotesize/
