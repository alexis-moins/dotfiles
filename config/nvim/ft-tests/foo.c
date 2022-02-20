
void nvim_do_autocmd(char *events, DICT *ops, Error *err)
{
    int au_group = AUGROUP_ALL;
    bool modeline = true;

    if (opts->group.type != kObjectTypeNil) {
        api_set_error(err, kErrorTypeValisation, "'group' must be an string");
        goto cleanup;
    }
}
