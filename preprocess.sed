s/^\\section{[^}]*}/\\end{frame}&\\begin{frame}\\frametitle{\\sectionprefix~\\insertsectionhead}/;
s/^\\sectionbreak\>/\\blfootnote{[\\insertsectionhead~is continued on the next slide.]}\\end{frame}\\begin{frame}\\frametitle{\\sectionprefix~\\insertsectionhead~[continued]}/;
s/^\\subsection{[^}]*}/\\end{frame}&\\begin{frame}\\frametitle{\\subsectionprefix~\\insertsubsectionhead}/;
s/^\\subsectionbreak\>/\\blfootnote{[\\insertsubsectionhead~is continued on the next slide.]}\\end{frame}\\begin{frame}\\frametitle{\\subsectionprefix~\\insertsubsectionhead~[continued]}/;
s/^\\begin{thebibliography}{}/&\\begin{frame}\\frametitle{References}/;
s/^\\end{thebibliography}/\\end{frame}&/;
s/^\\bibbreak\>/\\blfootnote{[References~is continued on the next slide.]}\\end{frame}\\begin{frame}\\frametitle{References~[continued]}/
