Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0AD96AAB70
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjCDRJf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRJe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:09:34 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFA1DBEB
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:09:33 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id b5so2341720iow.0
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949773;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0YDpOo1crnLVckQTnF05kLe+1PLdqbMZlNzDD40+vA=;
        b=mRvgBS47Odx4m+z/0jqqJSpT84OSRtSrXg0danO1rGEKCS1VfgH5hRkVeP+MIS4Exs
         jfw/aHeHaAIBfEfX2J/V+KhtnjoYvQLuFKr5aM8aHdJg48k5iRZDPV1p5kyfkMA/FoSG
         Tt1BdTJmh2fUOvN4LY7szLGa9F8TP2Akq8MiWfngESvtaagO9/WIyvy9+aUayf8tBQ7Z
         eSlXKugBscLs3twVR86vonwx6Xh0zPyqgXZCFDqVVGcJ73FdHahh9NQmtDEv88wJpO4O
         9r9N4kP1kccCakQqixlgT8RO4TxFINSQ0Wgz97TncXxNePareyZAaU9/LxD4PDO8w8lk
         8hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949773;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0YDpOo1crnLVckQTnF05kLe+1PLdqbMZlNzDD40+vA=;
        b=cUUQ+NgKgMG0viz7hbdcIpFi8ke244X3DbZhbBOuDKLXx6xJJOxyDl+KC+tmAbs9vz
         bv17S0Dq11P+fJnlhtKvLJlqIQocJlYoILOZhUt46062iiHqXf49nCYachzufpQgW4Cs
         HccBfpSgG/r0P0gh6FZOexo9+tGE6sIi2xpxywT8X8OlNsL/yFxWCQX72wCdsIYGjboL
         LqiTQ3B4totujCSp33RTSdzXgJsGngdN+gaHfRKS05YhN/BnrJii+yH0bbIW/UTPBVg4
         8vLsU7RhXcixSrz/nY2UgC6VjAkSX6fL425xzTKqe/i8Ru7zGpOyWREuuN+6xBnttGgA
         YYMA==
X-Gm-Message-State: AO0yUKWeta8D5AzKpV2R2WAi7zuO4dVf20y/cWOdpO8in77soxJA+gxy
        DnYiTyWWKtLi2i+Yd38Yl2Q=
X-Google-Smtp-Source: AK7set+dfNrvlEk9rDvj90uS2xInIPAoRsC7iz9WErtfWv/aeabDrePMbBUGBnsqLn0cOjSjBrM18w==
X-Received: by 2002:a5e:a810:0:b0:715:c1fd:94f8 with SMTP id c16-20020a5ea810000000b00715c1fd94f8mr3902703ioa.8.1677949773374;
        Sat, 04 Mar 2023 09:09:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x17-20020a92de11000000b003139668e844sm1511409ilm.13.2023.03.04.09.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:09:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:09:31 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 19/34] watchdog: nv_tco: Convert to platform remove
 callback returning void
Message-ID: <fad27f99-0633-447b-8a0f-002de532b562@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-20-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-20-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 03, 2023 at 10:37:01PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/nv_tco.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/nv_tco.c b/drivers/watchdog/nv_tco.c
> index f6902a337422..ac4a9c16341d 100644
> --- a/drivers/watchdog/nv_tco.c
> +++ b/drivers/watchdog/nv_tco.c
> @@ -446,12 +446,10 @@ static void nv_tco_cleanup(void)
>  	release_region(tcobase, 0x10);
>  }
>  
> -static int nv_tco_remove(struct platform_device *dev)
> +static void nv_tco_remove(struct platform_device *dev)
>  {
>  	if (tcobase)
>  		nv_tco_cleanup();
> -
> -	return 0;
>  }
>  
>  static void nv_tco_shutdown(struct platform_device *dev)
> @@ -469,7 +467,7 @@ static void nv_tco_shutdown(struct platform_device *dev)
>  
>  static struct platform_driver nv_tco_driver = {
>  	.probe		= nv_tco_init,
> -	.remove		= nv_tco_remove,
> +	.remove_new	= nv_tco_remove,
>  	.shutdown	= nv_tco_shutdown,
>  	.driver		= {
>  		.name	= TCO_MODULE_NAME,
> -- 
> 2.39.1
> 
