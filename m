Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE5650041C
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Apr 2022 04:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbiDNCZh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Apr 2022 22:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiDNCZg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Apr 2022 22:25:36 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF712E09D
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Apr 2022 19:23:13 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id c24-20020a9d6c98000000b005e6b7c0a8a8so2468027otr.2
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Apr 2022 19:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=HBtck2K0awjgFd1mJB2BGe8p5TjMvV6oJdH61YB6u9A=;
        b=fMgsjCG6jbyn5PEAt748712DNuKL/o5HPj3Fc/fhr+Ebyw75Up8CAXOYZBFXwmoOVs
         n4xNN7y8SDMrBibU6eIfObWInzPycO0hb7IeOJG68/L4qu56jSJUHdFHoRbTBMeuEFDe
         E1ogpKTbbKqFGhb6xrqeLHeseD18A272tVGfjbGPY70pt8YWl0puA8o9smWGZZsPlVSJ
         9yeQwCh8AQ6gBq2t6p4IWzc2v4peQnV/OTc5aQI00oOGg+3RZNnGXJn03Xe3X13xoBjQ
         TtL7tbWE1J1qInoKk+1fB9/po6kVqHJoEkTrFenV3DQLkt4OroLfHFTZE2aSl+fV2c5r
         B8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=HBtck2K0awjgFd1mJB2BGe8p5TjMvV6oJdH61YB6u9A=;
        b=fOKUOcMnDyajxUofc6zLq5bJE3yw7am2+i7FZb5P4dyZF82SphWbgvs1DqW+jyAYkK
         lRR8Ob4WhpVeIVmDAzKm1QBLO9sLP/G+tc5N8KNRQP64WurXOawdMXle8mxnR+dB63qe
         1kCfAXOBLszlRR4585DF0NLbwxZQTwpbRhBLqpmaar06lvHwUtDWf/Dp7zjwdgb7yNjM
         SSxlEOT2RqEfZocl6lGX2LUHqVEtauv8aqjGpINB0kvq99nA46EYCq0eKo+MvCoPoICQ
         daWWqs0dAyEOgo7VJq6K32bnLZWqTsX0HAOvQSze/rvYVd6fCiNXcqZThUTGMa3RCfE1
         yJVw==
X-Gm-Message-State: AOAM530sHiM6iwz0zU9s8suugAFjIxQ+Q0GneOFIi05L5pDsWTgaQ5Io
        R0DqfG3MxRYhcO/3z+ugrdxJUdCImNI=
X-Google-Smtp-Source: ABdhPJzQNRKkLiBE1xi2B7pVV4BGHqGrkqQ4S2MA9jkqymfzjp5yLPvtvr7JXQZj6vwjM1BzK0EQmA==
X-Received: by 2002:a9d:6d13:0:b0:5e9:62b5:eb7e with SMTP id o19-20020a9d6d13000000b005e962b5eb7emr215184otp.323.1649902992416;
        Wed, 13 Apr 2022 19:23:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a12-20020a056808128c00b002fa6d6c541dsm280655oiw.32.2022.04.13.19.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 19:23:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a9482495-ed8e-0847-ee47-eea212ee6ae6@roeck-us.net>
Date:   Wed, 13 Apr 2022 19:23:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     bjking@linux.ibm.com, nathanl@linux.ibm.com, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
References: <20220413165104.179144-1-cheloha@linux.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC v1 0/2] Add driver for PAPR watchdog timers
In-Reply-To: <20220413165104.179144-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/13/22 09:51, Scott Cheloha wrote:
> This series adds a driver for PAPR hypercall-based watchdog timers,
> tentatively named "pseries-wdt".
> 
> I wanted to get some clarification on a few things before submitting
> the series as a patch, hence the RFC.  The first patch adding the
> hypercall to hvcall.h is straightforward, but I have questions about
> the second patch (the driver).  In particular:
> 
> - In pseries_wdt_probe() we register the watchdog device with
>    devm_watchdog_register_device().  However, in pseries_wdt_remove(),
>    calling watchdog_unregister_devce() causes a kernel panic later,
>    so I assume this is the wrong thing to do.
> 

The whole point of using devm_ functions is to handle cleanup (or removal)
automatically. I would suggest to make yourself familiar with the concept.

>    Do we need to do anything to clean up the watchdog device during
>    pseries_wdt_remove()?  Or does devm_watchdog_register_device()
>    ensure the cleanup is handled transparently?
> 
> - In pseries_wdt_probe(), is it incorrect to devm_kfree() my
>    allocation in the event that devm_watchdog_register_device()
>    fails?
> 

No. Same thing.

> - The enormous hypercall input/output comment is mostly for my
>    edification.  It seems like the sort of thing that will rot over time.
>    I intend to remove most of it.  However, as far as I know the PAPR
>    revision containing these details is not published yet.  Should I
>    leave the comment in to ease review for now and remove it later?
>    Or should I omit it from the initial commit entirely?
> 
> - Should we print something to the console when probing/removing the
>    watchdog0 device or is that just noise?
> 
It is just noise, but some developers insist on it.

>    Most drivers (as distinct from devices) seem to print something
>    during initialization, so that's what I've done in
>    pseries_wdt_module_init() when the capability query succeeds.
> 
No. If you have to print something, print it during probe. module init
noise is even worse. And those error messages in the init function are
completely unacceptable.

Anyway, doesn't pseries support devicetree ? Why is this driver not
instantiated through a devicetree node ?

Guenter

> - The timeout action is currently hardcoded to a hard reset.  This
>    could be made configurable through a module parameter.  I intend
>    to do this in a later patch unless someone needs it included
>    in the initial patch.
> 
> - We set EIO if the hypercall fails in pseries_wdt_start() or
>    pseries_wdt_stop().  There is nothing userspace can do if this
>    happens.  All hypercall failures in these contexts are unexpected.
> 
>    Given all of that, is there is a more appropriate errno than EIO?
> 
> - The H_WATCHDOG spec indicates that H_BUSY is possible.  Is it
>    probable, though?  Should we spin and retry the hypercall in
>    the event that we see it?  Or is that pointless?
> 
