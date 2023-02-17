Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCF169B57F
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Feb 2023 23:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjBQW07 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Feb 2023 17:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjBQW06 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Feb 2023 17:26:58 -0500
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7035212B1
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Feb 2023 14:26:57 -0800 (PST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1718822c152so2755386fac.7
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Feb 2023 14:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwJ/Q2mFU5aOSOnhq6dC2teTLTOC4ZMvhGGNf3hn9zs=;
        b=AXZi/MkRR5BIIVb1NpcEdNHcYRQ0v6hL8I9BGxXbQMXUnAHCE/MqMEa8Y4KYLbBxpO
         BVP5kmvIkR0h/eNVb67v1iygbMpA0G8Q0/kquJsrnMMo0kPNZMhEafFelx2VRSXd+iYR
         hEFBipKDwloKdWqXCiQdQFMBaUI4rwiPArhnWlLhyC7g+dSTy3YUYOyZZXPsUf5F7ATy
         g/zQDMqN064sXW0toh2ZmEHgkDT9h+mEqb6Y64UTxb0KztKtVt2n7SlAQKo077BryvxQ
         Mfktb7hCZMSqU7j8TGES+Zj1lahpkEkExmF4cEh9T4UYvoAIT1r476kGHRjjznvQYzJH
         RfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwJ/Q2mFU5aOSOnhq6dC2teTLTOC4ZMvhGGNf3hn9zs=;
        b=36j93HCqN93rlhApT/iV8w8f510tctBTIoQ3J+7KOUvVD8Q8Q2YpKxdas6yCcvobLC
         O++kPmzzbxe+yyahiocpxYEdvr9eTG9MMZXTWm+MSIJSwbQkJBGN4u/BDtE+Mvx6thhN
         62McMp0HzX2nPw0dUoD4uRn9gs5tnZY3r6+L9ZzjnDVwWDCAp7YdHKHJIo4mFd9C0Fyo
         s4qJYdqm/3ThMuv/cQyMDGJ/fHsRr0m69sy4TaBh5+z97I64zxQo84M5YsC6U/LDue6L
         oQTBjzCTP4Pq6At8yECVLQQjmBRwQKQ3qHAojJmbfSzLJoXRuicARn3asGY6QoJYWynb
         D6gQ==
X-Gm-Message-State: AO0yUKVOOAa9rMd9VNxTMN+bBo3unyrB2RTOZ8jseSxY3Pv/KLKIRQkx
        kLWtQ+Ijq/+OxP6WSwQrjmr4Q9TKBnA=
X-Google-Smtp-Source: AK7set8rFJEvTiCeoKULT3bA72tu3RylK87GK9tddkpJ5haiISHSY07UnBgnybg9IWuYud64jpGRMA==
X-Received: by 2002:a05:6870:3453:b0:15f:4dc3:8800 with SMTP id i19-20020a056870345300b0015f4dc38800mr973733oah.23.1676672816990;
        Fri, 17 Feb 2023 14:26:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ds13-20020a0568705b0d00b0016e9308e17bsm1319623oab.52.2023.02.17.14.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 14:26:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Feb 2023 14:26:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: at91rm9200: Only warn once about problems in
 .remove()
Message-ID: <20230217222654.GA2614798@roeck-us.net>
References: <20230217095317.1213387-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217095317.1213387-1-u.kleine-koenig@pengutronix.de>
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

On Fri, Feb 17, 2023 at 10:53:17AM +0100, Uwe Kleine-König wrote:
> The single difference between returning 0 and returning an error code in
> a platform remove callback is that in the latter case the platform core
> emits a warning about the error being ignored.
> 
> at91wdt_remove() already emits a warning in the error case, so suppress
> the more generic (and less helpful) one by returning 0.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/at91rm9200_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/at91rm9200_wdt.c b/drivers/watchdog/at91rm9200_wdt.c
> index 5126454bb861..d57409c1a4d1 100644
> --- a/drivers/watchdog/at91rm9200_wdt.c
> +++ b/drivers/watchdog/at91rm9200_wdt.c
> @@ -270,7 +270,7 @@ static int at91wdt_remove(struct platform_device *pdev)
>  	misc_deregister(&at91wdt_miscdev);
>  	at91wdt_miscdev.parent = NULL;
>  
> -	return res;
> +	return 0;
>  }
>  
>  static void at91wdt_shutdown(struct platform_device *pdev)
> 
> base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
> -- 
> 2.39.1
> 
