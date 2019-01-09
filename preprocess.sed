s/\\section{\([^}]*\)}/\\end{frame}\\section{\1}\\begin{frame}\\frametitle{\\thesection.~\\insertsectionhead}/;
s/\\subsection{\([^}]*\)}/\\end{frame}\\subsection{\1}\\begin{frame}\\frametitle{\\thesection.\\thesubsection.~\\insertsubsectionhead}/
