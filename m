Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED11455F93D
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 09:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbiF2HhS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 03:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbiF2HhQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 03:37:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 56D6F369EE
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656488234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
        b=LqaQQ4rMNNaHAgwNqe1aoCTG75kn7/oNsqAIKCxO5hJyIk+F/Yw45XvOyYaLbryYdHBzdJ
        7bhG0i7WnNZRvAnFxgrRWBJIR3H02XwQGwDE9mvpMwd1ztR1wRLQMBek1iG7s251Msv7kc
        IxwAvqSKWZ18XPybTGnZsn34pvCYHnQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-MkQIqC9VPE6FLnCFGQaWyQ-1; Wed, 29 Jun 2022 03:37:12 -0400
X-MC-Unique: MkQIqC9VPE6FLnCFGQaWyQ-1
Received: by mail-wr1-f71.google.com with SMTP id o1-20020adfba01000000b0021b90bd28d2so2133299wrg.14
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 00:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
        b=gO+ySYXOu2jpzqzh9HMAMGtfgm0OoJjoEGN8DeZWXPtpBjyMtNh5m53n3ZuNgDn64Q
         O+3dZ2VzPLGUiFZw4XaIvD5G6Tw/HPFQUmJlPdgAZ6B45XOHqi8Wam+ncWIvp6qwDzDx
         8Jqe9hyuWWvMH/vFtuBVzOWWqGJ7sRwPBLEecj4kNXd4X2DD+dmS8UkUge2LctaBN2cC
         Zo9fGmN1l2jG5i+XxEC+3zGhkTBMQeFVLZquEmiwMUGTQV4oBMrply6e4E1sf9+t8con
         eFmXNTCbhtTrW97xk6/YuhcLkfxYIoJFeQZ6lidnIQQF5m+qHxzzmgz1FYDIsebhDEFS
         jzdQ==
X-Gm-Message-State: AJIora/NtvR6DtpeXCSIwy53a+vpsS3fCLRY2HrWs0gKfdfBnwPqBXfs
        z+veaB0Vj2KaUOpndd3Xu5dfe1v2pViZ5nS+9tjQGAYMWIwkRW82nptey4Az8zhcS3v7h4u3r6Z
        MpRWBNTnpTr7GSRqjzTslxYyXuXk=
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr1650291wrx.279.1656488231070;
        Wed, 29 Jun 2022 00:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfq7mqFRSJqFJPQOP6rs25Ch1nA7fBeueZwuaRaLaWENw0ay54yTOP4QHXmGLo1NEA4L9c5g==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr1650238wrx.279.1656488230741;
        Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d448a000000b0021b8c99860asm15832366wrq.115.2022.06.29.00.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Message-ID: <7654a74e-a410-a8a5-c228-d006dbbc200f@redhat.com>
Date:   Wed, 29 Jun 2022 09:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-fbdev@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-staging@lists.linux.dev, kasan-dev@googlegroups.com,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        openipmi-developer@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Support Opensource <support.opensource@diasemi.com>,
        netdev@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-crypto@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/29/22 09:23, Uwe Kleine-König wrote:
> Hello,
> 
> [I dropped nearly all individuals from the Cc: list because various
> bounces reported to be unhappy about the long (logical) line.]
>

Yes, it also bounced for me when I tried to reply earlier today.

> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> index 1e0fcec7be47..ddfa0bb5d9c9 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -39,13 +39,11 @@ static int ssd130x_i2c_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ssd130x_i2c_remove(struct i2c_client *client)
> +static void ssd130x_i2c_remove(struct i2c_client *client)
>  {
>  	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
>  
>  	ssd130x_remove(ssd130x);
> -
> -	return 0;
>  }
>  
>  static void ssd130x_i2c_shutdown(struct i2c_client *client)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

