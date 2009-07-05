AC_DEFUN([FW_TEMPLATE_FW_REVISION],
[
dnl TODO: This seems like a fragile way to compute the revision_type

  FW_REVISION_REVISION_TYPE=`perl -ne 'm/--revision_type (\S+)/ && print [$]1' bootstrap`
  FW_SUBST_PROTECT(FW_REVISION_REVISION_TYPE)

  test -e fw.local/revision/NAME || (cd fw.local/revision && ln -s "$FW_REVISION_REVISION_TYPE" NAME)

  AC_CONFIG_FILES([tests/Makefile
                   fw.local/Makefile
                   fw.local/revision/Makefile
                   fw.local/revision/NAME/Makefile])
])
