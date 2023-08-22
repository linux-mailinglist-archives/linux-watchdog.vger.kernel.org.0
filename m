Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56DE77844B6
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Aug 2023 16:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234842AbjHVOvL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Aug 2023 10:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236954AbjHVOvK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Aug 2023 10:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8737B126
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Aug 2023 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692715821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RAH/ryGiTaU20rxtZYgXGBs47r7l+mSCarD8RovE7Aw=;
        b=iwmHKLo9mXw9IUiH01wJueKfwUiI0JczLSLU/Xo+r4Mk0IxyVwQAtx6jPHQvJlcmvZFWOa
        +Js7/2sP2AARGdMRRE+u9UkBhYIe281EGynp1QZNbehR+YrVcyMYPMJBM5Rvf1eyaxWISr
        AYew3D/WM9Oy5huYW610AMQUxRB9Npw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-amkm4d0COG69JXK1sfGHow-1; Tue, 22 Aug 2023 10:50:19 -0400
X-MC-Unique: amkm4d0COG69JXK1sfGHow-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fe157ebea0so4578818e87.1
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Aug 2023 07:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692715818; x=1693320618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAH/ryGiTaU20rxtZYgXGBs47r7l+mSCarD8RovE7Aw=;
        b=dRfn6WP/6NyZjgRPyQikZH5082BxM1ztPn7A7nx874oNQ7Wper7L/kjqvZXd/cPuFM
         3Hy1rAV9e+W7+Hmk0uqJJH5Wqr4/bmemHqKLLcfin5mBhCM78C8LQsPkHDAAKCdOogYj
         0NPVtgRQt0cZ7TSo2eDJ//RSQun1LD2EjVApCqW/9gDubKcVGT9u88BcaXlEe7ENILEV
         +dtBzaOWhS/TyoKVRDndasLJ0WPW3H9WU5D9ZlQZ/mTdsF83mwnxl8h/79zYSDfvrJfg
         qVQvUbdefqkZd7tGyTL2QRhaSV0SxqVIaFIwHqFBCuDmvlz3W1QenllPkAVZqfx7zrku
         Pf3Q==
X-Gm-Message-State: AOJu0YyvvnHChd+cRcbqo+WUd7pJvG+E3cixKQ6I+mM21en945+I1Bs2
        T52boT2qS15fWKS87hmWX8Lz/cLn+OPphxiUoFLg5qhMACEiaEaJPwg7bHWf1w2AQ3G4OStYZ7l
        KnL/k9NGXxaQmBa2rbggIcUB1ndU=
X-Received: by 2002:a05:6512:b94:b0:4ff:8c0f:a745 with SMTP id b20-20020a0565120b9400b004ff8c0fa745mr8188727lfv.54.1692715817889;
        Tue, 22 Aug 2023 07:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiTDk5Bui7J0OrxHQ7Lrik1JVn/M1h3ENBHJe7+XVnhjGGlqt54RIc1grJP4zwK+xNqK/HxQ==
X-Received: by 2002:a05:6512:b94:b0:4ff:8c0f:a745 with SMTP id b20-20020a0565120b9400b004ff8c0fa745mr8188707lfv.54.1692715817512;
        Tue, 22 Aug 2023 07:50:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id e14-20020a50fb8e000000b00523653295f9sm7783110edq.94.2023.08.22.07.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 07:50:16 -0700 (PDT)
Message-ID: <a02b41a2-c390-8d05-ba2a-7a0a958013a8@redhat.com>
Date:   Tue, 22 Aug 2023 16:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/1] watchdog: simatic: Use idiomatic selection of P2SB
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>
References: <20230822141859.2139630-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230822141859.2139630-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 8/22/23 16:18, Andy Shevchenko wrote:
> While it's pretty much theoretical to be otherwise, make sure
> that P2SB is selected only for X86. This is idiomatic dependency
> which is used by all others who select it. Use it for Simatic
> as well.

Hmm, this already depends on SIEMENS_SIMATIC_IPC which itself
depends on X86, so as you already say this is not really necessary...

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Note this depends on / applies on top of 2 other
"config SIEMENS_SIMATIC_IPC_WDT" patches which
are currently pending in pdx86/for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

so this should probably be merged after 6.6-rc1 once
these other changes have been merged.

Regards,

Hans



> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index a75f6acb986b..751458959411 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1685,7 +1685,7 @@ config SIEMENS_SIMATIC_IPC_WDT
>  	depends on SIEMENS_SIMATIC_IPC && PCI
>  	default y
>  	select WATCHDOG_CORE
> -	select P2SB
> +	select P2SB if X86
>  	help
>  	  This driver adds support for several watchdogs found in Industrial
>  	  PCs from Siemens.

