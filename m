Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B010054F7DF
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jun 2022 14:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235842AbiFQMyO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jun 2022 08:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235059AbiFQMyN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jun 2022 08:54:13 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2C446B36
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Jun 2022 05:54:08 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-f2a4c51c45so5445490fac.9
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Jun 2022 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7ftkbXNEpCj75kv+GVHhgsHyy3L0bk9/lbo7U73Ht+A=;
        b=FR4loS9DSHUGmM5o51bq/z8cK8jPqYby/QIpeypLsTxq+Wr108RpNP4bYMMjnJhhyj
         tZt3aaN9pxsSPxecFGk1x1/cf3yQ7evsyBk4v97AURibi4tZxwiHLm2pdjV4CZzZHf2U
         hWnoDv2fIBu/TDM2yeio9TynlkmaLnnpi0ct6FBSdD6SlP8ZIlvP8ah0+Vo14g2GBkMq
         oZWHHFTjcYh2wIE/zQp5yGk5Tlc0caD7y/jitihmB9baBbylK0Tef9CkglhBAvyPTvX6
         jmSR8MWaaOJJmmJLwU1GD3VSg62A4VfrR1rEC5CPnp23Ak6ig/nRnMYSUiBA3owy5akU
         6lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7ftkbXNEpCj75kv+GVHhgsHyy3L0bk9/lbo7U73Ht+A=;
        b=cwNT9WB/g2IJx8B3x4l+RvkxA6tmMFJRROccNL7QSeM+fW3eDiR2dloKUHOdqJetLn
         RkMqZ85y3Oz/FPhQvNdFIW7fJGhtDFyPs1GJOyqIxuvOzjvXIH970y2gtExUW44OoIkK
         QVF9m/YKcvZXZofUzqI39/RZ4wabwCV2mGrCohSpfLKmSD0TO87aC8/ZAXp2Qkj03G1m
         Xt3xJDYe9qSYVThLjRMfbgZWlp8odbwORl+B3VcLkCIDB3sR++Kd7H+zrr0uozoXOSNA
         a1O188XQeGdQS90ckyfxMH0+e8DQdZEl5/ew7y+eYeYTxCA4Dqa/l1gDLyNFf620Yk0Y
         Cy7w==
X-Gm-Message-State: AJIora/zygZwSBQjyzPQGJbpQ3amMygFU0s23WfvnDSykdb2syrc8/7+
        Qd5tLny9Sxx7ooXzhAt4lFoFdB9sHHo=
X-Google-Smtp-Source: AGRyM1sxkKC24H5zCy4MAIbAh3/EfJmzqi4AFzaX1enKLKjPoi4/Tr+RDNZHMZXQTdZ/Q/E/+pVwgQ==
X-Received: by 2002:a05:6870:d29d:b0:fb:3915:2ce0 with SMTP id d29-20020a056870d29d00b000fb39152ce0mr5553987oae.132.1655470448082;
        Fri, 17 Jun 2022 05:54:08 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834? ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
        by smtp.gmail.com with ESMTPSA id o7-20020a9d5c07000000b0060bf6213084sm2401139otk.27.2022.06.17.05.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 05:54:07 -0700 (PDT)
Message-ID: <d5c8c055-5856-7fbe-0415-edc7b2ce26a6@gmail.com>
Date:   Fri, 17 Jun 2022 09:54:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/4] pseries-wdt: initial support for H_WATCHDOG-based
 watchdog timers
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru,
        vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org,
        brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux@roeck-us.net
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
From:   Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220602175353.68942-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 6/2/22 14:53, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
> adds support for this hypercall to powerpc/pseries kernels and
> introduces a new watchdog driver, "pseries-wdt", for the virtual
> timers exposed by the hypercall.
> 
> This series is preceded by the following:
> 
> RFC v1: https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
> RFC v2: https://lore.kernel.org/linux-watchdog/20220509174357.5448-1-cheloha@linux.ibm.com/
> PATCH v1: https://lore.kernel.org/linux-watchdog/20220520183552.33426-1-cheloha@linux.ibm.com/

Tested successfully with mainline QEMU plus Alexey's new h_watchdog patches in
https://patchwork.ozlabs.org/project/qemu-ppc/list/?series=305226.


All patches of this series:

Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Thanks,


Daniel

> 
> Changes of note from PATCH v1:
> 
> - Trim down the large comment documenting the H_WATCHDOG hypercall.
>    The comment is likely to rot, so remove anything we aren't using
>    and anything overly obvious.
> 
> - Remove any preprocessor definitions not actually used in the module
>    right now.  If we want to use other features offered by the hypercall
>    we can add them in later.  They're just clutter until then.
> 
> - Simplify the "action" module parameter.  The value is now an index
>    into an array of possible timeoutAction values.  This design removes
>    the need for the custom get/set methods used in PATCH v1.
> 
>    Now we merely need to check that the "action" value is a valid
>    index during pseries_wdt_probe().  Easy.
> 
> - Make the timeoutAction a member of pseries_wdt, "action".  This
>    eliminates the use of a global variable during pseries_wdt_start().
> 
> - Use watchdog_init_timeout() idiomatically.  Check its return value
>    and error out of pseries_wdt_probe() if it fails.
> 
> 
