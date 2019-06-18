Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 481374A7D8
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2019 19:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbfFRRGO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jun 2019 13:06:14 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34679 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729541AbfFRRGN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jun 2019 13:06:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so5972296plt.1
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Jun 2019 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QLljHQmZ3eCZz+/JHIZxTTCV1PMH1QQlNZP1BOMHXxc=;
        b=eD41wZPvWOoLFK7Nz0yz974p+/v8RfDzd+EM7ugFW9u4r3NJtoyUvWTPQ3491xIYs7
         2bvQXSQCJjuc05VysjqzrDnATWAPw+mrsiMVhmWMbN+Ran1722A6KnyWe4ZTyOj9TiDI
         9lRKj5hr23laNyqYytBKDrmAC9SghNTCM8WH92RLTqNcQnpKcRLOwM3qh0lFriSGezhk
         J80a043rynByTPs01qYdNDo+dtrCMiQqocc39o1mSnx6VcwvTjcyMmm2pWDZL9ZRwmUo
         K/KfHcUGVt0luLmreZNwH5BoqQlzeO+tSKjlgM8rmiuLlcQqGPUXjMjbqYmZo9tZLmwc
         sc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QLljHQmZ3eCZz+/JHIZxTTCV1PMH1QQlNZP1BOMHXxc=;
        b=BSGA0eltCylaPornjvgsGkvPku7dzKXQ6gqnzdG0JMcicnNZiDZkRAmrDoIrR6xiUI
         XXJtaiUWAgQaXQ6hYliK4vQs8GFZb/SF5VTbWsS1/nqTa2oCoSAjQHRIlK+vSEh0LZVS
         BydO+K6kNFur67EzcPprovAc48txfgTRcDBwU5n8BLzltiRf2s2W4Y//chdS3o27I6gu
         oz3AZYlWbPIKHTxeVdNQlMKcS0HVpfw1mk+kgDJ2yqcNIYR3y9R41NseH75gxBGKfbiQ
         lVX0fV3CSFrUQXokZAyNj18kj1WM5tHvtyG3o2CWZrz0hp28r5qXgjbVr+Nh1FzyiTrG
         QpfQ==
X-Gm-Message-State: APjAAAUH8Izk5EGTSBUCqcaG900dcG6ZHZ/XdZQAlV+SLuU1aZ3Iee/C
        9DwPpWOm4Zgi6e2ex7iX0YgD4znM
X-Google-Smtp-Source: APXvYqwJUMn5TgyRoQ17K5aeVQEJem1kDn+bJHJc9l0JrAKByIsCRZ54MIhE+UuBGD4rt6avNxsLaw==
X-Received: by 2002:a17:902:768b:: with SMTP id m11mr42677416pll.191.1560877573273;
        Tue, 18 Jun 2019 10:06:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d132sm17206365pfd.61.2019.06.18.10.06.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 10:06:12 -0700 (PDT)
Date:   Tue, 18 Jun 2019 10:06:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tomas Winkler <tomas.winkler@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: mei_wdt: no need to check return value of
 debugfs_create functions
Message-ID: <20190618170611.GB10509@roeck-us.net>
References: <20190618155830.GB21825@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618155830.GB21825@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 18, 2019 at 05:58:30PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mei_wdt.c | 30 +++++++-----------------------
>  1 file changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
> index 8023cf28657a..96a770938ff0 100644
> --- a/drivers/watchdog/mei_wdt.c
> +++ b/drivers/watchdog/mei_wdt.c
> @@ -539,38 +539,23 @@ static void dbgfs_unregister(struct mei_wdt *wdt)
>  	wdt->dbgfs_dir = NULL;
>  }
>  
> -static int dbgfs_register(struct mei_wdt *wdt)
> +static void dbgfs_register(struct mei_wdt *wdt)
>  {
> -	struct dentry *dir, *f;
> +	struct dentry *dir;
>  
>  	dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
> -	if (!dir)
> -		return -ENOMEM;
> -
>  	wdt->dbgfs_dir = dir;
> -	f = debugfs_create_file("state", S_IRUSR, dir, wdt, &dbgfs_fops_state);
> -	if (!f)
> -		goto err;
>  
> -	f = debugfs_create_file("activation",  S_IRUSR,
> -				dir, wdt, &dbgfs_fops_activation);
> -	if (!f)
> -		goto err;
> +	debugfs_create_file("state", S_IRUSR, dir, wdt, &dbgfs_fops_state);
>  
> -	return 0;
> -err:
> -	dbgfs_unregister(wdt);
> -	return -ENODEV;
> +	debugfs_create_file("activation", S_IRUSR, dir, wdt,
> +			    &dbgfs_fops_activation);
>  }
>  
>  #else
>  
>  static inline void dbgfs_unregister(struct mei_wdt *wdt) {}
> -
> -static inline int dbgfs_register(struct mei_wdt *wdt)
> -{
> -	return 0;
> -}
> +static inline void dbgfs_register(struct mei_wdt *wdt) {}
>  #endif /* CONFIG_DEBUG_FS */
>  
>  static int mei_wdt_probe(struct mei_cl_device *cldev,
> @@ -623,8 +608,7 @@ static int mei_wdt_probe(struct mei_cl_device *cldev,
>  	if (ret)
>  		goto err_disable;
>  
> -	if (dbgfs_register(wdt))
> -		dev_warn(&cldev->dev, "cannot register debugfs\n");
> +	dbgfs_register(wdt);
>  
>  	return 0;
>  
> -- 
> 2.22.0
> 
