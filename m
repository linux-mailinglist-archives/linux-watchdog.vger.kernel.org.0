Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E67B86AAB83
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjCDROI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:14:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCDROH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:14:07 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0CEE079
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:14:07 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id 4so3860321ilz.6
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677950046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bb/3uTjzeyzShpDLpb3avsAyQtSdcsQ/8OdgiW/5EpM=;
        b=h2bsbE9m54CRt7UWxrdj8gF/HeVCxt7VXtPdjMEPdCvGF+Skyei2dn1iC1DfIuj3Gh
         EP0REmfwpBWIpXt0Z4CEjvbxs7J0ZOL3eVoy45Pwt18Yk9o8xDsO8J04lHlG6dRrfBou
         gv3lEpUadbGHrUkWneFi1LZX2auGnfeszx6kbl07x4khE/F5FFIUdU+f/N8Zi5DkZLAk
         ltnfyr90uIJlO6yHQPI3Eo0xeKuz0N9TWAh0soCjjVAG6WV0bTKx+668FxTbyFlGrLze
         51FbPxpkguoPRbFo2jPNRialPL3mj4/8079G6r5AKcIUJvzvXJR5r2GjuWH2Ixeyb4u7
         5isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677950046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb/3uTjzeyzShpDLpb3avsAyQtSdcsQ/8OdgiW/5EpM=;
        b=dMNApmoNR2Ea1SCN6Y6pQx6LNLn185OnucWCtk0ulbN1RPVY81jjRkEb/0Jnkt6Dch
         V5lAUC3Qi/R4bInvlCU4PjUycjdBbEh0VFWfLYYpRa7XLa4K41PiLgXS6Ggaclj0l/HI
         6BVMlR/3w5O9zbFBWvlcXO/qim3DKTgnD3t6cVsdDKPTTqWMxVC+GTzSe/pn9UWGPc2a
         1zPCTfwckJcPW+q6Ppg0avpGXEX6bFbBRPlqxua7WtOUVf5AwE34eK8hVEHsDbHOShvw
         S/ABS/bSPHDCZPC8Z/vwijcm9Hi2TRJdzf6rkKONpSU6/bSd53btGAjgPmJr/4SnfAt/
         4YSg==
X-Gm-Message-State: AO0yUKV0JMc5CupVgSAlAFSzgW3igLGSYga+Upy84LgI1hyvE0X35wNs
        gaxhVsK+TMwuwDvz5mbhXr8=
X-Google-Smtp-Source: AK7set+UgmHZPV4rfx3dOXf3QjEksFH/hDR6UHT2WsZdcBSM6QTWoZsfNVukGoqc9W204o11Ag2U5Q==
X-Received: by 2002:a05:6e02:1907:b0:315:4169:c5ac with SMTP id w7-20020a056e02190700b003154169c5acmr5179266ilu.30.1677950046489;
        Sat, 04 Mar 2023 09:14:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7-20020a0566380ec700b003b49e7d990asm1674456jas.30.2023.03.04.09.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:14:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:14:05 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-watchdog@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 33/34] watchdog: stmp3xxx_rtc: Convert to platform remove
 callback returning void
Message-ID: <337786d1-9d42-466c-8057-849e417a3392@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-34-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-34-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:15PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/stmp3xxx_rtc_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xxx_rtc_wdt.c
> index 7caf3aa71c6a..4b2caa9807ac 100644
> --- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
> +++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
> @@ -109,10 +109,9 @@ static int stmp3xxx_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int stmp3xxx_wdt_remove(struct platform_device *pdev)
> +static void stmp3xxx_wdt_remove(struct platform_device *pdev)
>  {
>  	unregister_reboot_notifier(&wdt_notifier);
> -	return 0;
>  }
>  
>  static int __maybe_unused stmp3xxx_wdt_suspend(struct device *dev)
> @@ -144,7 +143,7 @@ static struct platform_driver stmp3xxx_wdt_driver = {
>  		.pm = &stmp3xxx_wdt_pm_ops,
>  	},
>  	.probe = stmp3xxx_wdt_probe,
> -	.remove = stmp3xxx_wdt_remove,
> +	.remove_new = stmp3xxx_wdt_remove,
>  };
>  module_platform_driver(stmp3xxx_wdt_driver);
>  
> -- 
> 2.39.1
> 
