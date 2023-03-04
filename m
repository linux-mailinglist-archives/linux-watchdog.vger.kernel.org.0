Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 497056AAB5C
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjCDRCE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjCDRCD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:02:03 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755D21E2B2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:02:02 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id l2so3835788ilg.7
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZrMqxQUUUhRcYCSff2XbF87NljZz3Zzwd28IylSpNo=;
        b=MtEif02U2DVetrf8xVf0/ChYcUAGhtl/11ip2+zLtAcuxJnK/tFBTuMfJebi3MlJlu
         Pen/SGzeTtNDJUizakgPglgpn+Jc70PI5gF9EEKJDfL1+TgVsXd5fK2xBYL1mY30bJ92
         fpbIyhzKRbWVXW/pMxayksLsc83kn5UPUkiRDamTgf6AfNoSqQU4XhCIEcHKc9Q/WuNR
         gm4ta9l8UVASFGESqhSXuKxkP285dCCOLiv5U85UhV3+Q094ix/cajdld0QGLXaaE8Pb
         KY1j+G9hFkaWAXXVhphvk0DHL+mJgxWFOijGRPqBfJ6TpDf7WeEpvs6Zc0dc09dDvKJY
         Zf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZrMqxQUUUhRcYCSff2XbF87NljZz3Zzwd28IylSpNo=;
        b=qj2wn5+pQMzfHSVVCQw0ZTRdlH7yktuBqYuy9IC9EjRXfSsQ/RVPnwRcr7eJ441MNJ
         kA0lah2TjTveZqpWnyDImpgYSZrgiwQxDYMYq4Azg+z3mTEyJ4L+5xsWaW9ovU96GN/m
         XQQIjQozy4589+h8FniBXBrSJcicWv/826sVdql4RQkZmYku2G4245KdfgR7gH2qCHyY
         pNLteDs03OBryoExLB5Fv0FFPFLDyWqk9U1y1867tliIM5qlmjtj46TOZw3JHqbfS9O+
         4buTE8AIoxxc/1THqpjvhP4GdlD10Ik0kncttnXNuw2zkf3AcUJv5sisPMugKeF9jw+C
         glAw==
X-Gm-Message-State: AO0yUKXEldcGZcE8o57OQQ1BGrhoD3uuXxozManNvsdqd0WGxYVLAEcO
        ZrpX5IB0Ev+jwX/JovGzlE8=
X-Google-Smtp-Source: AK7set/YRM+WHjh07DnoQXpwhLMiqQwjTSE6O5HkoFOwA2xSV6c8gXApPdxgNc7fHSk+JuxDgAnLqg==
X-Received: by 2002:a05:6e02:811:b0:314:27c:a730 with SMTP id u17-20020a056e02081100b00314027ca730mr5958997ilm.0.1677949321849;
        Sat, 04 Mar 2023 09:02:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t5-20020a02ab85000000b003c4f35c21absm1594939jan.137.2023.03.04.09.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:02:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:02:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 02/34] watchdog: acquirewdt: Convert to platform remove
 callback returning void
Message-ID: <455f37d6-06a4-43de-902a-70a3125dffd8@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-3-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:44PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/acquirewdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/acquirewdt.c b/drivers/watchdog/acquirewdt.c
> index bc6f333565d3..53b04abd55b0 100644
> --- a/drivers/watchdog/acquirewdt.c
> +++ b/drivers/watchdog/acquirewdt.c
> @@ -271,14 +271,12 @@ static int __init acq_probe(struct platform_device *dev)
>  	return ret;
>  }
>  
> -static int acq_remove(struct platform_device *dev)
> +static void acq_remove(struct platform_device *dev)
>  {
>  	misc_deregister(&acq_miscdev);
>  	release_region(wdt_start, 1);
>  	if (wdt_stop != wdt_start)
>  		release_region(wdt_stop, 1);
> -
> -	return 0;
>  }
>  
>  static void acq_shutdown(struct platform_device *dev)
> @@ -288,7 +286,7 @@ static void acq_shutdown(struct platform_device *dev)
>  }
>  
>  static struct platform_driver acquirewdt_driver = {
> -	.remove		= acq_remove,
> +	.remove_new	= acq_remove,
>  	.shutdown	= acq_shutdown,
>  	.driver		= {
>  		.name	= DRV_NAME,
> -- 
> 2.39.1
> 
