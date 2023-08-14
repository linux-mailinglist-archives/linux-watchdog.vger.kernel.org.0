Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7BD77B43D
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Aug 2023 10:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233577AbjHNIfU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Aug 2023 04:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbjHNIfA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Aug 2023 04:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1007410D
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Aug 2023 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692002056;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RgXFFW+V5FTk3EF/2a/DSCETIneRMJrqKo+yjAx/Zs8=;
        b=ZqDUQF/7CR7bo7ZN0YTiMJsYJvu5C3shHLfRta1e6k0cKKJyc9sZdabovWOgmWznSecQRw
        lGAEVyPh8GpZuWOQ5/i1EUBlnViEwpZMZFfvnhF+WiWFhuUEdEkxB9368zS7iouLCiw1Gc
        VsLV+e0EUlKHKsLJo32Wl+oLbJ7Bvtk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-H-w33H0aOY-UPx90uxqErg-1; Mon, 14 Aug 2023 04:34:08 -0400
X-MC-Unique: H-w33H0aOY-UPx90uxqErg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a355c9028so245330066b.3
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Aug 2023 01:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692002047; x=1692606847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgXFFW+V5FTk3EF/2a/DSCETIneRMJrqKo+yjAx/Zs8=;
        b=K7o6Rf0dPaLDwhrvFyHDFWS/eq9QUOg+gCG+mnFWCfwxedh7PY3Y3tLC4LSc8zYSqJ
         lI8/BLdKbSpA3rp7TqV3mL+1sjFHQXF6jG7bst4MAoF8eYF+dPdMyvSjICtglwGWSuDl
         8dZoq0uLC96AwwvxjYST0GyZIzOmXVfYAOxZXrxrXr+mneHSqrqGutIIlRiK76DikpPU
         63mVr9dXhWhY2FpkZmNbb60AlI4XGihcPYqbG1yGBuPy/SMUOU0CYbq9fzWk+Z6vMF/k
         5OuF7YF0vfWJFAugErdwx8BcqmkF9/LkoclkuI5OMmq0mj5xT5QUWp134zgGqZEcotcw
         zqYw==
X-Gm-Message-State: AOJu0YwGH/h4BfXitQeWLfD+fBE48wf6vp8GSh+BszvRihWyY/i1+1tq
        1+qmwAthvD3C1eJugiqjcBJlOxgWaR0CwYRu01+TCm3D1zffMkaKmNWXjnbnXPv5OgHvNpiGZtE
        QPyh+kJJ3BFYJbM15V8js0BiewAI=
X-Received: by 2002:a17:907:7608:b0:99c:180a:ea61 with SMTP id jx8-20020a170907760800b0099c180aea61mr6625101ejc.32.1692002047131;
        Mon, 14 Aug 2023 01:34:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfL8E6nRn9oKZz3TvrEP1iFjy7/Sw0a6a81AvTaKtEKUsy7RECnJhv7Kt6XCM66ig2D9GMbw==
X-Received: by 2002:a17:907:7608:b0:99c:180a:ea61 with SMTP id jx8-20020a170907760800b0099c180aea61mr6625092ejc.32.1692002046875;
        Mon, 14 Aug 2023 01:34:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gf17-20020a170906e21100b00992e14af9c3sm5470076ejb.143.2023.08.14.01.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:34:06 -0700 (PDT)
Message-ID: <cf05f66b-c74e-79b8-f2ec-a41a2c7c5ead@redhat.com>
Date:   Mon, 14 Aug 2023 10:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] MAINTAINERS: Add entries for Siemens IPC modules
Content-Language: en-US, nl
To:     Gerd Haeussler <haeussler.gerd@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Xing Tong Wu <xingtong.wu@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>
References: <20230814073114.2885-1-haeussler.gerd@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230814073114.2885-1-haeussler.gerd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 8/14/23 09:31, Gerd Haeussler wrote:
> From: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> 
> There are different IPC driver modules in the kernel that are actively
> maintained by Siemens but not yet listed in the MAINTAINERS file.
> Add the missing entries.
> 
> Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  MAINTAINERS | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f966f05fb0d..6ca5564a4f8c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19402,6 +19402,32 @@ F:	drivers/media/mmc/siano/
>  F:	drivers/media/usb/siano/
>  F:	drivers/media/usb/siano/
>  
> +SIEMENS IPC LED DRIVERS
> +M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> +M:	Xing Tong Wu <xingtong.wu@siemens.com>
> +M:	Tobias Schaffner <tobias.schaffner@siemens.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +F:	drivers/leds/simple/
> +
> +SIEMENS IPC PLATFORM DRIVERS
> +M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> +M:	Xing Tong Wu <xingtong.wu@siemens.com>
> +M:	Tobias Schaffner <tobias.schaffner@siemens.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/siemens/
> +F:	include/linux/platform_data/x86/simatic-ipc-base.h
> +F:	include/linux/platform_data/x86/simatic-ipc.h
> +
> +SIEMENS IPC WATCHDOG DRIVERS
> +M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> +M:	Xing Tong Wu <xingtong.wu@siemens.com>
> +M:	Tobias Schaffner <tobias.schaffner@siemens.com>
> +L:	linux-watchdog@vger.kernel.org
> +S:	Maintained
> +F:	drivers/watchdog/simatic-ipc-wdt.c
> +
>  SIFIVE DRIVERS
>  M:	Palmer Dabbelt <palmer@dabbelt.com>
>  M:	Paul Walmsley <paul.walmsley@sifive.com>

